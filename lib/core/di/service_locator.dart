import 'package:epms_tech/data/repository/auth_repository_impl.dart';
import 'package:epms_tech/data/repository/master_data_repository_impl.dart';
import 'package:epms_tech/domain/repositories/auth_repository.dart';
import 'package:epms_tech/domain/repositories/master_data_repository.dart';
import 'package:epms_tech/domain/usecases/login_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final sl = GetIt.instance; // sl = service locator

Future<void> initDependencies() async {
  // 1. Register Hive Box
  final box = await Hive.openBox('epms_data');
  sl.registerSingleton<Box>(box);
  // Singleton = desain pattern (pola) yang harus memiliki 1 objek 
  // registerSingleton = memberikan Objek yang sama (dibuat Sekali)
  // dan bisa diakses dalam applikasi
  // registerFactory = bikin objek baru setiap kali dipanggil
  // registerLazySingleton = dibuat hanya sekali, tapi baru di buat saat pertama kali dipanggil (lazy loading).

  // 2. Register Repository (repository impl diikat ke interface)
  // function save and get schema
  sl.registerLazySingleton<MasterDataRepository>(
    () => MasterDataRepositoryImpl(box: sl<Box>()),
  );
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(baseUrl: ''),);

  // 3. Register Usecases 
  // function login
  sl.registerLazySingleton(() => LoginUsecase(sl<AuthRepository>()));
}

