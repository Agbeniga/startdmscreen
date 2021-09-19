import 'package:startdmscreen/app/app.locator.dart';
// import 'package:startdmscreen/app/app.router.dart';
import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';
import 'package:startdmscreen/models/start_dm_models.dart';
import 'package:startdmscreen/package/base/server-request/api/http_api.dart';

class StartDmViewModel extends BaseViewModel {
  final _apiService = locator<HttpApiService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  // List<UserModel> _userResults = [
  //   UserModel(
  //     fullName: 'Adegoke Abram',
  //     displayName: 'OyinkanUA',
  //     imageUrl:
  //         'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
  //     isOnline: false,
  //     isChecked: false,
  //   ),
  //   UserModel(
  //     fullName: 'Demi Aaron',
  //     displayName: 'damiAaron',
  //     imageUrl:
  //         'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
  //     isOnline: true,
  //     isChecked: false,
  //   ),
  //   UserModel(
  //       fullName: 'maxiron',
  //       displayName: 'maxiron',
  //       imageUrl:
  //           'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
  //       isOnline: true,
  //       isChecked: false),
  //   UserModel(
  //       fullName: 'Jimmy',
  //       displayName: 'Engr_Jimmy',
  //       imageUrl:
  //           'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
  //       isOnline: true,
  //       isChecked: false),
  //   UserModel(
  //       fullName: 'Happix',
  //       displayName: 'Happix',
  //       imageUrl:
  //           'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
  //       isOnline: true,
  //       isChecked: false),
  //   UserModel(
  //       fullName: 'Name',
  //       displayName: 'displayName',
  //       imageUrl:
  //           'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
  //       isOnline: true,
  //       isChecked: false),
  //   UserModel(
  //       fullName: 'Name',
  //       displayName: 'displayName',
  //       imageUrl:
  //           'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
  //       isOnline: true,
  //       isChecked: false),
  //   UserModel(
  //       fullName: 'Name',
  //       displayName: 'displayName',
  //       imageUrl:
  //           'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
  //       isOnline: true,
  //       isChecked: false),
  //   UserModel(
  //       fullName: 'Name',
  //       displayName: 'displayName',
  //       imageUrl:
  //           'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
  //       isOnline: true,
  //       isChecked: false),
  //   UserModel(
  //       fullName: 'Name',
  //       displayName: 'displayName',
  //       imageUrl:
  //           'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
  //       isOnline: true,
  //       isChecked: false),
  //   UserModel(
  //       fullName: 'Name',
  //       displayName: 'displayName',
  //       imageUrl:
  //           'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
  //       isOnline: true,
  //       isChecked: false),
  //   UserModel(
  //       fullName: 'Name',
  //       displayName: 'displayName',
  //       imageUrl:
  //           'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
  //       isOnline: true,
  //       isChecked: false),
  // ];

  Future<List<UserModel>> allUsers() async {
    String _currentOrgId =
        storageService.getString(StorageKeys.currentOrgId) ?? '';
    const endpoint = '/organizations/{_currentOrgId}/members/';
    final response = await _apiService.get(
      endpoint,
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response?.statusCode == 200) {
      print(response?.data?['data'].length);
      return (response?.data?['data'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  List<UserModel> get userResults async {
    List<UserModel> _userResults = await allUsers();
    return [..._userResults];
  }
//  runFilter(String query) {
//     final List<UserModel> mockResults = [];
//     if (query.length != 0) {
//       var lowercaseQuery = query.toLowerCase();
//       return mockResults.where((profile) {
//         return profile.fullName!.toLowerCase().contains(query.toLowerCase()) ||
//             profile.displayName!.toLowerCase().contains(query.toLowerCase());
//       }).toList(growable: false)
//         ..sort((a, b) => a.fullName!
//             .toLowerCase()
//             .indexOf(lowercaseQuery)
//             .compareTo(b.fullName!.toLowerCase().indexOf(lowercaseQuery)));
//     }
//       return mockResults;
//   }
}
