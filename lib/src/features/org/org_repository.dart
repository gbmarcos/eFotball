import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/data/network_service.dart';
import 'package:fifa/src/features/org/model/org.dart';
import 'package:fpdart/fpdart.dart';

class OrgRepository {
  final NetworkService _client;

  OrgRepository({required NetworkService client}) : _client = client;

  /// An array of orgs.
  ///   - [featured] (string)
  ///    	- "1" only returns clubs that have the featured flag
  ///   - TO-DO: search (string)
  ///    	- The club name to search
  ///   - TO-DO: limit (u32)
  ///    	- The maximum amount of results to return
  ///   - TO-DO: offset (u32)
  ///    	- The number of results to skip before the results
  ///

  Future<Either<NetworkException, List<Org>>> listOrgs({
    String featured = '0',
  }) async {
    final data = {'featured': featured};

    final response = await _client.get('/orgs/list', query: data);

    return response.map<List<Org>>((dynamic a) => orgsFromJson(a as List<dynamic>));
  }
}
