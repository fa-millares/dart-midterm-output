import 'dart:io';
import 'dart:math';
import 'package:emojis/emojis.dart'; // to use Emoji collection

// rounds: multiple
// score: visible
class yourRecord {
  int wins = 0;
  int loss = 0;
  int draws = 0;

  yourRecord(this.wins, this.loss, this.draws);

  int get winCount {
    return wins;
  }  int get lossCount {
    return loss;
  }  int get drawsCount {
    return draws;
  }

  updateWins(int newWins) {
    wins += newWins;
  }  updateLoss(int newLoss) {
    loss += newLoss;
  }  updateDraws(int newDraws) {
    draws += newDraws;
  }
}

String getpMove() {
  print("Bato, Papel, Gunting, Butiki, Spock! Ano pipiliin mo?");
  String selection = stdin.readLineSync().toUpperCase();

  //The program can accept values of any of the following text cases (UPPERCASE, lowercase, TitleCase)
  switch (selection.toLowerCase()) {
  //
    case "bato":
      return "Bato";
      break;
    case "papel":
      return "Papel";
      break;
    case "gunting":
      return "Gunting";
      break;
    case "butiki":
      return "Butiki";
      break;
    case "spock":
      return 'Spock';
      break;

    default:
      return "Quit";
      break;
  }
}
yourRecord yourRecordNew = yourRecord(0,0,0);
/// Return a random move in the form of a string of either
String getBot() {
  Random rand = new Random();
  int move = rand.nextInt(5); //random int from 0 to 4

  switch (move) {
    case 0:
      return "Bato";
      break;
    case 1:
      return "Papel";
      break;
    case 2:
      return "Gunting";
      break;
    case 3:
      return "Butiki";
      break;
    case 4:
      return "Spock";
      break;
    default:
      break;
  }
}

/// Determines win of player vs computer
/// by comparing [pMove] to [Bot]
String whoWon(String pMove, String Bot) {
  if (pMove == Bot) {
    //if the same, it's a tie
    yourRecordNew.updateDraws(1);
    return "Tie";

  } else if (pMove == "Bato" && Bot == "Gunting");
    else if (pMove == "Bato" && Bot == "Butiki") {
    yourRecordNew.updateWins(1);
    return "You Win!";
  } else if (pMove == "Gunting" && Bot == "Papel");
    else if (pMove == "Gunting" && Bot =="Butiki") {
    yourRecordNew.updateWins(1);
    return "You Win!";
  } else if (pMove == "Papel" && Bot == "Bato");
    else if (pMove == "Papel" && Bot == "Spock") {
    yourRecordNew.updateWins(1);
    return "You Win!";
  } else if (pMove == "Butiki" && Bot == "Spock");
    else if (pMove == "Butiki" && Bot == "Papel"){
    yourRecordNew.updateWins(1);
    return "You Win!";
  } else if (pMove == "Spock" && Bot == "Gunting");
    else if (pMove == "Spock" && Bot == "Bato"){
    yourRecordNew.updateWins(1);
    return "You Win!";
  } else {
    //if it's not a tie and you didn't win, computer won
    yourRecordNew.updateLoss(1);
    return "Bot Wins!";
  }
}

String toEmoji(selection) {
  //The program prints the results as emoji icons.
  switch (selection) {
  //
    case "Bato":
      return ('${Emojis.oncomingFistMediumLightSkinTone}');
      break;
    case "Papel":
      return ('${Emojis.raisedBackOfHandMediumLightSkinTone}');
      break;
    case "Gunting":
      return ('${Emojis.victoryHandMediumLightSkinTone}');
      break;
    case "Butiki":
      return ('${Emojis.lizard}');
      break;
    case "Spock":
      return ('${Emojis.vulcanSaluteMediumLightSkinTone}');
      break;
    default: //if anything but R, P, or S
      return "Quit";
      break;
  }
}

void main() {

  while (true) {
    //loops the game for more rounds
    var currentW = yourRecordNew.winCount;
    var currentL = yourRecordNew.lossCount;
    var currentD = yourRecordNew.drawsCount;
    print(
        "Player score: $currentW Wins | $currentL Loss | $currentD Draws \n");

    String pMove = getpMove();
    if (pMove == "Quit") {
      return; // exit
    }

    var pMoveEmoji = toEmoji(pMove);
    print("You played $pMoveEmoji");
    String Bot = getBot();

    var BotEmoji = toEmoji(Bot);
    print("Computer played $BotEmoji");
    print(whoWon(pMove, Bot));
  }
}