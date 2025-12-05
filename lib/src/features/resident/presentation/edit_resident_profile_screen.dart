import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../application/resident_provider.dart';
import '../data/resident_repository.dart';
import '../data/dtos/update_resident_request_dto.dart';
import '../domain/resident.dart';

class EditResidentProfileScreen extends ConsumerStatefulWidget {
  final Resident resident;

  const EditResidentProfileScreen({super.key, required this.resident});

  @override
  ConsumerState<EditResidentProfileScreen> createState() => _EditResidentProfileScreenState();
}

class _EditResidentProfileScreenState extends ConsumerState<EditResidentProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers para los campos editables
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _dniController;
  late TextEditingController _genderController;
  late TextEditingController _receiptIdController;

  late TextEditingController _streetController;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _zipCodeController;
  late TextEditingController _countryController;

  DateTime? _selectedBirthDate;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Inicialización de controladores con los datos actuales del residente
    _firstNameController = TextEditingController(text: widget.resident.firstName ?? '');
    _lastNameController = TextEditingController(text: widget.resident.lastName ?? '');
    _dniController = TextEditingController(text: widget.resident.dni ?? '');
    _genderController = TextEditingController(text: widget.resident.gender ?? '');
    _receiptIdController = TextEditingController(text: widget.resident.receiptId?.toString() ?? '');

    _streetController = TextEditingController(text: widget.resident.street ?? '');
    _cityController = TextEditingController(text: widget.resident.city ?? '');
    _stateController = TextEditingController(text: widget.resident.state ?? '');
    _zipCodeController = TextEditingController(text: widget.resident.zipCode ?? '');
    _countryController = TextEditingController(text: widget.resident.country ?? '');

    _selectedBirthDate = widget.resident.birthDate;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dniController.dispose();
    _genderController.dispose();
    _receiptIdController.dispose();

    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    // Obtenemos el residente original para acceder a los datos no editables (DNI, BirthDate)
    final residentOriginal = widget.resident;

    setState(() => _isLoading = true);

    try {
      // 1. CONSTRUIR EL DTO DE ACTUALIZACIÓN (SIN el campo 'id' en el cuerpo)
      final requestDto = UpdateResidentRequestDto(
        // CAMPOS EDITABLES (de los controladores)
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        dni: _dniController.text.trim(),
        birthDate: _selectedBirthDate ?? residentOriginal.birthDate!,
        gender: _genderController.text.trim(),
        receiptId: int.tryParse(_receiptIdController.text.trim()) ?? residentOriginal.receiptId,

        street: _streetController.text.trim(),
        city: _cityController.text.trim(),
        state: _stateController.text.trim(),
        zipCode: _zipCodeController.text.trim(),
        country: _countryController.text.trim(),
      );

      // 2. LLAMAR AL REPOSITORIO
      // Pasamos el ID (para la URL) y el DTO (para el body)
      await ref.read(residentRepositoryProvider).updateResident(residentOriginal.id, requestDto);

      // 3. Invalidar el provider para que la pantalla de perfil recargue con los nuevos datos
      ref.invalidate(residentProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Perfil actualizado correctamente")),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error al actualizar: $e"), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Perfil"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.teal[800],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _isLoading ? null : _saveProfile,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle("Información Personal"),
                    Row(
                      children: [
                        Expanded(child: _buildTextField("Nombre", _firstNameController, Icons.person)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildTextField("Apellido", _lastNameController, Icons.person_outline)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildTextField("DNI", _dniController, Icons.badge, keyboardType: TextInputType.number),
                    const SizedBox(height: 16),

                    // Date Picker for Birth Date
                    InkWell(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedBirthDate ?? DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          setState(() => _selectedBirthDate = picked);
                        }
                      },
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: "Fecha de Nacimiento",
                          prefixIcon: const Icon(Icons.cake, color: Colors.teal),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        child: Text(
                          _selectedBirthDate != null
                              ? "${_selectedBirthDate!.day}/${_selectedBirthDate!.month}/${_selectedBirthDate!.year}"
                              : "Seleccionar fecha",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(child: _buildTextField("Género", _genderController, Icons.wc)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildTextField("ID Recibo", _receiptIdController, Icons.receipt_long, keyboardType: TextInputType.number)),
                      ],
                    ),

                    const SizedBox(height: 24),
                    _buildSectionTitle("Dirección"),
                    _buildTextField("Calle y Número", _streetController, Icons.home),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: _buildTextField("Ciudad", _cityController, Icons.location_city)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildTextField("Estado/Provincia", _stateController, Icons.map)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: _buildTextField("Código Postal", _zipCodeController, Icons.markunread_mailbox)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildTextField("País", _countryController, Icons.public)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.teal[800],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, IconData icon, {TextInputType? keyboardType}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.teal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.teal, width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (value) {
        if (label == 'Email' && value != null && value.isNotEmpty && !value.contains('@')) {
          return 'Ingrese un correo electrónico válido.';
        }
        return null;
      },
    );
  }
}