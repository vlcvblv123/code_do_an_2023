import 'package:CodeGenius/Online_Course/common/entities/entities.dart';


class ProfileStates{
  final UserItem? userProfile;
  const ProfileStates({this.userProfile});
  ProfileStates copyWith({UserItem? userProfile}){
    return ProfileStates(userProfile: userProfile??this.userProfile);
  }
}