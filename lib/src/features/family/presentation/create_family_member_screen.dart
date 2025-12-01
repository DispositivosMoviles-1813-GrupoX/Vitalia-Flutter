import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../auth/application/auth_notifier.dart';
import '../../resident/application/resident_provider.dart';
import '../../resident/data/dtos/create_resident_request_dto.dart';
import '../data/family_repository.dart';
import '../data/dtos/create_family_member_request_dto.dart';

class CreateFamilyMemberScreen extends ConsumerStatefulWidget {
  const CreateFamilyMemberScreen({super.key});

  @override
  ConsumerState<CreateFamilyMemberScreen> createState() => _CreateFamilyMemberScreenState();
}

class _CreateFamilyMemberScreenState extends ConsumerState<CreateFamilyMemberScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  
  // Family Member Fields
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _relationshipController = TextEditingController();
  final _residentIdController = TextEditingController();

  // Resident Fields
  final _resDniController = TextEditingController();
  final _resFirstNameController = TextEditingController();
  final _resLastNameController = TextEditingController();
  final _resCityController = TextEditingController();
  final _resStateController = TextEditingController();
  final _resCountryController = TextEditingController();
  final _resStreetController = TextEditingController();
  final _resZipCodeController = TextEditingController();
  final _resReceiptIdController = TextEditingController();
  DateTime? _resBirthDate;
  String _resGender = 'Masculino';

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Completar Perfil"),
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: "Vincular Existente"),
            Tab(text: "Registrar Nuevo"),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildLinkExistingTab(),
                  _buildRegisterNewTab(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    foregroundColor: Colors.white,
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Guardar y Continuar"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkExistingTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Datos del Familiar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildTextField(_firstNameController, "Nombre", Icons.person),
          const SizedBox(height: 16),
          _buildTextField(_lastNameController, "Apellido", Icons.person_outline),
          const SizedBox(height: 16),
          _buildTextField(_relationshipController, "Relación (ej. Hijo)", Icons.people),
          const SizedBox(height: 24),
          const Text("Datos del Residente", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildTextField(_residentIdController, "ID del Residente", Icons.badge, isNumber: true, helperText: "Solicite este ID a la administración"),
        ],
      ),
    );
  }

  Widget _buildRegisterNewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Datos del Familiar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildTextField(_firstNameController, "Nombre", Icons.person),
          const SizedBox(height: 16),
          _buildTextField(_lastNameController, "Apellido", Icons.person_outline),
          const SizedBox(height: 16),
          _buildTextField(_relationshipController, "Relación (ej. Hijo)", Icons.people),
          const SizedBox(height: 24),
          
          const Text("Datos del Nuevo Residente", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildTextField(_resDniController, "DNI", Icons.badge, isNumber: true),
          const SizedBox(height: 16),
          _buildTextField(_resFirstNameController, "Nombre Residente", Icons.person),
          const SizedBox(height: 16),
          _buildTextField(_resLastNameController, "Apellido Residente", Icons.person_outline),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildTextField(_resCityController, "Ciudad", Icons.location_city)),
              const SizedBox(width: 16),
              Expanded(child: _buildTextField(_resStateController, "Estado/Provincia", Icons.map)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildTextField(_resCountryController, "País", Icons.public)),
              const SizedBox(width: 16),
              Expanded(child: _buildTextField(_resZipCodeController, "Código Postal", Icons.local_post_office, isNumber: true)),
            ],
          ),
          const SizedBox(height: 16),
          _buildTextField(_resStreetController, "Dirección", Icons.home),
          const SizedBox(height: 16),
          
          InkWell(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime(1950),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (date != null) setState(() => _resBirthDate = date);
            },
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: "Fecha de Nacimiento",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
              ),
              child: Text(_resBirthDate == null ? "Seleccionar fecha" : DateFormat('yyyy-MM-dd').format(_resBirthDate!)),
            ),
          ),
          const SizedBox(height: 16),
          
          DropdownButtonFormField<String>(
            value: _resGender,
            decoration: const InputDecoration(
              labelText: "Género",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.wc),
            ),
            items: const [
              DropdownMenuItem(value: "Masculino", child: Text("Masculino")),
              DropdownMenuItem(value: "Femenino", child: Text("Femenino")),
            ],
            onChanged: (val) => setState(() => _resGender = val!),
          ),
          const SizedBox(height: 16),
          _buildTextField(_resReceiptIdController, "ID de Recibo (Opcional)", Icons.receipt, isNumber: true),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isNumber = false, String? helperText}) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icon),
        helperText: helperText,
      ),
      validator: (value) {
        // Only validate fields relevant to the current tab
        if (_tabController.index == 0) {
           // Link Existing Tab
           if (controller == _resDniController || 
               controller == _resFirstNameController || 
               controller == _resLastNameController ||
               controller == _resCityController ||
               controller == _resStateController ||
               controller == _resCountryController ||
               controller == _resStreetController ||
               controller == _resZipCodeController ||
               controller == _resReceiptIdController) {
             return null;
           }
        } else {
           // Register New Tab
           if (controller == _residentIdController) return null;
        }

        if (value == null || value.isEmpty) {
          if (controller == _resReceiptIdController) return null; // Optional field
          return "Campo requerido";
        }
        return null;
      },
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_tabController.index == 1 && _resBirthDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Seleccione fecha de nacimiento")));
      return;
    }

    setState(() => _isLoading = true);

    try {
      final user = ref.read(authNotifierProvider).value;
      if (user == null) throw Exception("Usuario no autenticado");

      int residentId;

      if (_tabController.index == 0) {
        // Link Existing
        residentId = int.parse(_residentIdController.text.trim());
      } else {
        // Create New Resident
        final residentRequest = CreateResidentRequestDto(
          dni: _resDniController.text.trim(),
          firstName: _resFirstNameController.text.trim(),
          lastName: _resLastNameController.text.trim(),
          city: _resCityController.text.trim(),
          state: _resStateController.text.trim(),
          country: _resCountryController.text.trim(),
          street: _resStreetController.text.trim(),
          zipCode: _resZipCodeController.text.trim(),
          birthDate: _resBirthDate!,
          gender: _resGender,
          receiptId: _resReceiptIdController.text.trim().isNotEmpty 
              ? int.parse(_resReceiptIdController.text.trim()) 
              : null,
        );

        final resident = await ref.read(residentRepositoryProvider).createResident(residentRequest);
        residentId = resident.id;
      }

      final familyRequest = CreateFamilyMemberRequestDto(
        relationship: _relationshipController.text.trim(),
        linkedResidentId: residentId,
        fullName: FullNameDto(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
        ),
        userId: user.id,
      );

      await ref.read(familyRepositoryProvider).createFamilyMember(familyRequest);

      // Update local user state with the new residentId
      ref.read(authNotifierProvider.notifier).setResidentId(residentId);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Perfil creado exitosamente")),
        );
        context.go('/home');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e"), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
