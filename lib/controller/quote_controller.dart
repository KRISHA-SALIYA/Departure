import 'package:flutter/material.dart';

class QuoteController extends ChangeNotifier {
  List<String> allQuotes = [
    'The soul is never born, it never dies having come into being once, it never ceases to be. Unborn, eternal, abiding and primeval, it is not slain when the body is slain..!!',
    'Death is certain for the born, and re-birth is certain for the death; therefore you should not feel grief for what is inevitable..!!',
    'You have a right to perform your prescribed duties, but you are not entitled to the fruits of your actions..!!',
    'Weapons do not cleave the soul, fire does not burn it, waters do not wet it, and wing does not dry it..!!',
    'O Arjun, I know of past, present, and future, and I also know all living beings; but no one knows about me..!!',
    'Lust, anger and greed, these are the three doors to self-destructive hell. Thus, one should avoid these..!!',
    'Those who are disciplined in eating and recreation, balanced in work, and regulated in sleep, can mitigate all sorrows by practicing Yoga..!!',
    'From anger there comes delusion; from delusion, the loss of memory; from the loss of memory, the destruction of discrimination; and with the destruction of discrimination, he is lost..!!',
    'Die, and you will win heaven; conquer, and you will enjoy sovereignty of the earth, therefore, stand up Arjuna, determined to fight..!!'
        'To work alone you have the right, and not to the fruits. Do not be impelled by the fruits of work. Nor have attachment to inaction..!!',
  ];

  List<String> allHeading = [
    'Soul Is Permanent',
    'Death Is Truth',
    'Do Not Expect Anything',
    'Soul Is Immortal',
    'He, Who knows Everything',
    'Stay Away From Bad Things',
    'Practice Yoga',
    'Control Over Your Senses',
    'Do Not Give Up',
    'Do Your Karma',
  ];

  List<String> allQuotesHindi = [
    'आत्मा कभी जन्म नहीं लेती, एक बार अस्तित्व में आने के बाद वह कभी मरती नहीं, वह कभी समाप्त नहीं होती। अजन्मा, शाश्वत, स्थायी और आदिम, यह शरीर के मारे जाने पर नहीं मारा जाता..!!',
    'जन्म लेने वाले की मृत्यु निश्चित है, और मृत्यु के लिए पुनर्जन्म निश्चित है; इसलिए जो अपरिहार्य है उसके लिए आपको दुःख महसूस नहीं करना चाहिए..!!',
    'आपको अपने निर्धारित कर्तव्य निभाने का अधिकार है, लेकिन आप अपने कर्मों के फल के हकदार नहीं हैं..!!',
    'हथियार आत्मा को काटते नहीं, अग्नि जलाती नहीं, जल गीला नहीं करता और पंख सुखाते नहीं..!!',
    'हे अर्जुन, मैं भूत, वर्तमान और भविष्य को जानता हूं और सभी प्राणियों को भी जानता हूं; लेकिन मेरे बारे में कोई नहीं जानता..!!',
    'काम, क्रोध और लोभ, ये आत्म-विनाशकारी नरक के तीन द्वार हैं। अत: इनसे बचना चाहिए..!!',
    'जो लोग खाने और मनोरंजन में अनुशासित, काम में संतुलित और नींद में संयमित हैं, वे योगाभ्यास द्वारा सभी दुखों को कम कर सकते हैं..!!',
    'क्रोध से भ्रम उत्पन्न होता है; भ्रम से, स्मृति की हानि; स्मृति के नष्ट होने से, विवेक के नष्ट होने से; और विवेक के नाश से वह नष्ट हो जाता है..!!',
    'मर जाओ, और तुम स्वर्ग जीतोगे; जीतो, और तुम पृथ्वी की संप्रभुता का आनंद लोगे, इसलिए, लड़ने के लिए दृढ़ संकल्पित होकर खड़े हो जाओ अर्जुन..!!'
        'तुम्हें अकेले काम करने का अधिकार है, फल का नहीं। कर्म के फल से प्रभावित न हों. न ही अकर्मण्यता में आसक्ति है..!!',
  ];
  List<String> allHeadingHindi = [
    'आत्मा स्थायी है',
    'मृत्यु सत्य है',
    'कुछ भी उम्मीद मत करो',
    'आत्मा अमर है',
    'वह, जो सब कुछ जानता है',
    'बुरी बातों से दूर रहें',
    'योग का अभ्यास करें',
    'अपनी इंद्रियों पर नियंत्रण रखें',
    'हार नहीं माने',
    'अपना कर्म करो',
  ];

  int currentIndex = 0;

  bool canBack = false;
  bool canForward = true;

  clickNext() {
    if (currentIndex < allQuotes.length - 1) {
      currentIndex++;
      canBack = true;
    } else {
      canForward = false;
    }
    notifyListeners();
  }

  clickPrev() {
    if (currentIndex > 0) {
      currentIndex--;
      canForward = true;
    } else {
      canBack = false;
    }
    notifyListeners();
  }
}
