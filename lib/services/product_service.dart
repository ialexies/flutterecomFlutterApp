import 'package:flutterecom/repository/repository.dart';

class ProductService {
  Repository _repository;

  ProductService() {
    _repository = Repository();
  }

  getHotProducts() async {
    return await _repository.httpGet('get-all-hot-products');
  }
}
