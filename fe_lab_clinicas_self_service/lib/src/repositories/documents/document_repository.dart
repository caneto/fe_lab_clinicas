import 'dart:typed_data';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

abstract interface class DocumentRepository {
  Future<Either<RepositoryException, String>> uploadImage(Uint8List file, String fileName);
}