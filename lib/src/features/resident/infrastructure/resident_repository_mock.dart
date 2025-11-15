import '../domain/resident.dart';

class ResidentRepositoryMock {
  Future<Resident> getResident() async {

    await Future.delayed(const Duration(seconds: 1));

    return Resident(
      id: "1",
      fullName: "María Fernanda Vargas",
      age: 82,
      photoUrl: "https://i.pravatar.cc/150?img=65",
      status: "Estable",
      lastUpdate: DateTime.now(),
    );
  }
}
