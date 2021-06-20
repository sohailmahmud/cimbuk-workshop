import 'package:prokit_flutter/integrations/models/ContentModel.dart';
import 'package:prokit_flutter/integrations/screens/LikeButton/LBHomePage.dart';
import 'package:prokit_flutter/integrations/screens/Marquee/MHomePage.dart';
import 'package:prokit_flutter/integrations/screens/Shimmer/SHomePage.dart';
import 'package:prokit_flutter/integrations/screens/ShowViewCase/SVCHomePage.dart';
import 'package:prokit_flutter/integrations/screens/StickyHeader/stickyHeaderHomePage.dart';
import 'package:prokit_flutter/integrations/screens/api/get_method_api_integration.dart';
import 'package:prokit_flutter/integrations/screens/api/post_method_api_integration.dart';
import 'package:prokit_flutter/integrations/screens/before_after_image_screen.dart';
import 'package:prokit_flutter/integrations/screens/button_screen.dart';
import 'package:prokit_flutter/integrations/screens/confetti/CHomePage.dart';
import 'package:prokit_flutter/integrations/screens/fluid_slider_screen.dart';
import 'package:prokit_flutter/integrations/screens/flutterCalender/CalenderHomePage.dart';
import 'package:prokit_flutter/integrations/screens/flutterTinderCard/TinderHomePage.dart';
import 'package:prokit_flutter/integrations/screens/folding_cell_screen.dart';
import 'package:prokit_flutter/integrations/screens/google_map_screen.dart';
import 'package:prokit_flutter/integrations/screens/google_signin_screen.dart';
import 'package:prokit_flutter/integrations/screens/liquid_pull_to_refresh_screen.dart';
import 'package:prokit_flutter/integrations/screens/liquid_swipe_screen.dart';
import 'package:prokit_flutter/integrations/screens/picker_screen.dart';
import 'package:prokit_flutter/integrations/screens/razorpay_screen.dart';
import 'package:prokit_flutter/integrations/screens/shader_mask_screen.dart';
import 'package:prokit_flutter/integrations/screens/singature_screen.dart';
import 'package:prokit_flutter/integrations/screens/sliding_panel_screen.dart';
import 'package:prokit_flutter/integrations/screens/wave_screen.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';

Future<List<ContentModel>> getContents(context) async {
  List<ContentModel> list = List();

  var cat1Item1 = ContentModel(title: 'Before After Image', pageName: BeforeAfterImageScreen());
  var cat1Item2 = ContentModel(title: 'Google Sign In', pageName: GoogleSignInScreen());
  var cat1Item3 = ContentModel(title: 'Wave Widget', pageName: WaveScreen());
  var cat1Item4 = ContentModel(title: 'Signature Pad', pageName: SignatureScreen());
  var cat1Item5 = ContentModel(title: 'Liquid Swipe WalkThrough', pageName: LiquidSwipeScreen());

  var cat1Item6 = ContentModel(title: 'Calender', pageName: CalenderHomePage());

  var cat1Item7 = ContentModel(title: 'Confitte', pageName: CHomePage());
  var cat1Item8 = ContentModel(title: 'TinderCard', pageName: TinderHomePage());
  var cat1Item9 = ContentModel(title: 'Show Case View', pageName: SVCHomePage());

  list.add(ContentModel(title: 'Integrations', subTitle: 'Ready-made code', bgColor: appCat1, items: [
    cat1Item1,
    cat1Item2,
    cat1Item3,
    cat1Item4,
    cat1Item5,
    cat1Item6,
    cat1Item7,
    cat1Item8,
    cat1Item9,
  ]));

  var cat2Item1 = ContentModel(title: 'Custom Buttons', bgColor: appCat4, pageName: ButtonScreen());
  var cat2Item2 = ContentModel(title: 'Pickers', bgColor: appCat6, pageName: PickerScreen());
  var cat2Item3 = ContentModel(title: 'Slider', bgColor: appCat6, pageName: FluidSliderScreen());
  var cat2Item4 = ContentModel(title: 'ShaderMask', bgColor: appCat6, pageName: ShaderMaskScreen());
  var cat2Item5 = ContentModel(title: 'Marquee', pageName: MHomePage());
  var cat2Item6 = ContentModel(title: 'Like Button', pageName: LBHomePage());
  list.add(ContentModel(title: 'UI Interactions', subTitle: 'List of Widgets', bgColor: appCat2, items: [
    cat2Item1,
    cat2Item2,
    cat2Item3,
    cat2Item4,
    cat2Item5,
    cat2Item6,
  ]));

  var cat3Item1 = ContentModel(title: 'Liquid Pull To Refresh', pageName: LiquidPullToRefreshScreen());
  var cat3Item2 = ContentModel(title: 'Folding Cell in ListView', pageName: FoldingCellScreen());
  var cat3Item3 = ContentModel(title: 'Shimmer', pageName: SHomePage());
  var cat3Item4 = ContentModel(title: 'Sticky Header', pageName: StickyHeaderHomePage());
  list.add(
    ContentModel(
      title: 'Lists',
      subTitle: 'Different type Lists',
      pageName: GoogleMapScreen(),
      bgColor: appCat3,
      icon: 'ic_list.png',
      items: [
        cat3Item1,
        cat3Item2,
        cat3Item3,
        cat3Item4,
      ],
    ),
  );

  var cat5Item1 = ContentModel(title: 'Google Maps with Clusttering', pageName: GoogleMapScreen());
  var cat5Item2 = ContentModel(title: 'Google Maps Sliping Panel', pageName: SlidingPanelScreen());
  list.add(ContentModel(title: 'Maps', subTitle: 'Maps Integrations', bgColor: appCat4, icon: 'ic_map_pin_line.png', items: [cat5Item1, cat5Item2]));

  var cat6Item1 = ContentModel(title: 'RazorPay Payment', pageName: RazorPayScreen());
  list.add(ContentModel(title: 'Payment Gateways', subTitle: 'Payment Gateways Integrations', bgColor: appCat5, icon: 'ic_payment.png', items: [cat6Item1]));

  var cat7Item1 = ContentModel(title: 'GET example with FutureBuilder', pageName: GETMethodExampleScreen(),tag: 'New');
  var cat7Item2 = ContentModel(title: 'POST example', pageName: PostMethodExampleScreen(),tag: 'New');
  list.add(
    ContentModel(
      title: 'REST API Integrations',
      subTitle: 'GET and POST method example',
      bgColor: appCat6,
      icon: 'ic_payment.png',
      items: [cat7Item1, cat7Item2],
      tag: 'New',
    ),
  );
  return list;
}
