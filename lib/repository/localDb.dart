import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  static final LocalDb _repo = LocalDb.internal();
  static late SharedPreferences _sharedPreferences;
  LocalDb.internal();
  factory LocalDb() {
    return _repo;
  }
  static void init() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void setRewardedDate(DateTime date){
    _sharedPreferences.setString(_Keys.rewardedDate.key, date.toString());
  }

  DateTime? getRewardedDate() {
    var res = _sharedPreferences.getString(_Keys.rewardedDate.key);
    if(res == null){
      return null;
    }
    return DateTime.parse(res);
  }

  void resetRewardedTime(){
    _sharedPreferences.remove(_Keys.rewardedDate.key);
  }
}

enum _Keys{
  rewardedDate('rewardedDate');
  final String key;
  const _Keys(this.key);
}