import 'dart:convert';
import 'dart:io';

import 'package:process_runner/process_runner.dart';

/// File in which the last [SingleTournamentCliData] is stored as a cache.
const _cachedCredentialsFile = './.conf.json';
//
void main(List<String> arguments) {}

void createSimpleTournament() async {
  final processRunner = ProcessRunner();
  await processRunner.runProcess([curlCreateTournament], printOutput: true);
}

SingleTournamentCliData? _loadConfigurationFromJson() {
  try {
    final storedCredentials = jsonDecode(File(_cachedCredentialsFile).readAsStringSync()) as Map<String, dynamic>;
    return SingleTournamentCliData.fromJson(storedCredentials);
  } catch (e) {
    print("Exception trying to load configuration from $_cachedCredentialsFile $e");
  }
}

const curlCreateTournament = '''
 curl 'https://fifa-staging-api.oneplace.club/admin/tournament/create'                                                                                                                                                     croxx@fedoracer
  -H 'authority: fifa-staging-api.oneplace.club' 
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' 
  -H 'dnt: 1' 
  -H 'sec-ch-ua-mobile: ?0' 
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.36 Safari/537.36 Edg/97.0.1072.28' 
  -H 'sec-ch-ua-platform: "Linux"' 
  -H 'content-type: multipart/form-data; boundary=----WebKitFormBoundaryOWZQAm3gkQ5WAqCa' 
  -H 'accept: */*' 
  -H 'origin: https://fifa-staging.oneplace.club' 
  -H 'sec-fetch-site: same-site' 
  -H 'sec-fetch-mode: cors' 
  -H 'sec-fetch-dest: empty' 
  -H 'referer: https://fifa-staging.oneplace.club/' 
  -H 'accept-language: en-US,en;q=0.9' 
  --data-raw \$'------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="name"\r\n\r\nTest tournament cli \r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="description"\r\n\r\n<p><span style="background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sed cursus lorem. Nam interdum sed risus non laoreet. Vivamus vel lorem suscipit, consectetur mi ut, ornare sapien. Proin velit nibh, facilisis non mollis in, iaculis sed urna. Nunc fringilla odio vel fringilla placerat. Curabitur tempus felis porttitor arcu gravida molestie. Sed feugiat odio et ligula dignissim posuere.</span></p>\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="stream_url"\r\n\r\n\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="discord_url"\r\n\r\n\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="slots"\r\n\r\n2\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="round_start_times"\r\n\r\n1640195317\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="league_id"\r\n\r\nnull\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="format"\r\n\r\n1\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="flags"\r\n\r\n33\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="prize_count"\r\n\r\n0\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="game_id"\r\n\r\nfifa21\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="half_length"\r\n\r\n6\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="match_speed"\r\n\r\nnormal\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="squad_type"\r\n\r\nonline\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="control_type"\r\n\r\nany\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="difficulty"\r\n\r\nworldclass\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="injuries"\r\n\r\ntrue\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="offsides"\r\n\r\ntrue\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="bookings"\r\n\r\ntrue\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="handballs"\r\n\r\nfalse\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="_u"\r\n\r\n67\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa\r\nContent-Disposition: form-data; name="_t"\r\n\r\nwkcgooxG-PGm\r\n------WebKitFormBoundaryOWZQAm3gkQ5WAqCa--\r\n' 
  --compressed
''';

class SingleTournamentCliData {
  final int lastTournamentId;
  final String user1Name;
  final String user1Password;
  final String user2Name;
  final String user2Password;

  SingleTournamentCliData({
    required this.lastTournamentId,
    required this.user1Name,
    required this.user1Password,
    required this.user2Name,
    required this.user2Password,
  });
  factory SingleTournamentCliData.fromJson(Map<String, dynamic> json) {
    return SingleTournamentCliData(
      lastTournamentId: json["lastTournamentId"] as int,
      user1Name: json["user1Name"] as String,
      user1Password: json["user1Password"] as String,
      user2Name: json["user2Name"] as String,
      user2Password: json["user2Password"] as String,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "last_tournament_id": lastTournamentId,
      "user_1_name": user1Name,
      "user_1_password": user1Password,
      "user_2_name": user2Name,
      "user_2_password": user2Password
    };
  }

  String toJson() => jsonEncode(toMap());
}
