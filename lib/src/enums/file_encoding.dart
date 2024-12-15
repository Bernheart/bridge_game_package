import 'package:bridge_game/bridge_game.dart';

enum FileEncoding {
  pbn({
    BoardVulnerability.none: 'None',
    BoardVulnerability.NS: 'NS',
    BoardVulnerability.EW: 'EW',
    BoardVulnerability.both: 'All'
  }),
  lin({
    BoardVulnerability.none: '0',
    BoardVulnerability.NS: 'N',
    BoardVulnerability.EW: 'E',
    BoardVulnerability.both: 'B'
  });

  final Map<BoardVulnerability, String> boardVulnerabilityNames;

  const FileEncoding(this.boardVulnerabilityNames);
}
