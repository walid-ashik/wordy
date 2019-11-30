import 'package:Wordy/ui/home.dart';

class DataUtil {
  static List<Word> getPrepositionList() {
    var prepositionList = new List<Word>();

    prepositionList.add(new Word(1001,'above', 'in extended space over and not touching', 'a display of fireworks above the town'));
    prepositionList.add(new Word(1002,'about', 'on the subject of; concerning', 'I was thinking about you'));
    prepositionList.add(new Word(1003,'after', 'in the time following (an event or another period of time)', 'shortly after their marriage they moved to Colorado'));
    prepositionList.add(new Word(1004,'below', 'at a lower level or layer than', 'just below the pocket was a stain'));
    prepositionList.add(new Word(1005,'with', 'accompanied by (another person or thing)', 'a nice steak with a bottle of red wine'));
    prepositionList.add(new Word(1006,'under', 'extending or directly below.', 'vast stores of gas under the North Sea'));
    prepositionList.add(new Word(1007,'from', 'indicating the point in space at which a journey, motion, or action starts', 'she began to walk away from him'));
    prepositionList.add(new Word(1008,'for', 'with the object or purpose of', 'to work for wages'));
    prepositionList.add(new Word(1009,'out', 'moving or appearing to move away from a particular place, especially one that is enclosed or hidden', 'he walked out into the street'));
    prepositionList.add(new Word(10010,'over', 'extending directly upwards from', 'I saw flames over Berlin'));
    prepositionList.add(new Word(10011,'over', 'extending directly upwards from', 'I saw flames over Berlin'));

    return prepositionList;
  }

  static List<Word> getPositiveWords() {
    var prepositionList = new List<Word>();

    prepositionList.add(new Word(2001,'bright', 'giving out or reflecting much light; shining', 'the sun was dazzlingly bright'));
    prepositionList.add(new Word(2002,'cool', 'free from excitement, anxiety, or excessive emotion', 'he prided himself on keeping a cool head'));
    prepositionList.add(new Word(2003,'loving', 'in the time following (an event or another period of time)', 'shortly after their marriage they moved to Colorado'));
    prepositionList.add(new Word(2004,'loyal', 'at a lower level or layer than', 'just below the pocket was a stain'));
    prepositionList.add(new Word(2005,'polite', 'accompanied by (another person or thing)', 'a nice steak with a bottle of red wine'));
    prepositionList.add(new Word(2006,'wise', 'extending or directly below.', 'vast stores of gas under the North Sea'));
    prepositionList.add(new Word(2007,'witty', 'indicating the point in space at which a journey, motion, or action starts', 'she began to walk away from him'));
    prepositionList.add(new Word(2008,'giving', 'with the object or purpose of', 'to work for wages'));
    prepositionList.add(new Word(2009,'kind', 'moving or appearing to move away from a particular place, especially one that is enclosed or hidden', 'he walked out into the street'));
    prepositionList.add(new Word(20010,'smart', 'extending directly upwards from', 'I saw flames over Berlin'));
    prepositionList.add(new Word(20011,'divine', 'extending directly upwards from', 'I saw flames over Berlin'));

    return prepositionList;
  }
}
