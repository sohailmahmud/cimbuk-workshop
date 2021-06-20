import 'package:prokit_flutter/qibus/model/QiBusModel.dart';
import 'package:prokit_flutter/qibus/utils/QiBusColors.dart';
import 'QiBusImages.dart';
import 'QiBusStrings.dart';

List<QIBusBookingModel> QIBusGetData() {
  List<QIBusBookingModel> mRecentSearchList = List<QIBusBookingModel>();
  mRecentSearchList.add(new QIBusBookingModel(QIBus_lbl_DelhiToMubai, QIBus_lbl_date));
  mRecentSearchList.add(new QIBusBookingModel(QIBus_lbl_MumbaiToPune, QIBus_lbl_date));
  mRecentSearchList.add(new QIBusBookingModel(QIBus_lbl_AhmedabadToMumbai, QIBus_lbl_date));
  mRecentSearchList.add(new QIBusBookingModel(QIBus_lbl_JaipurToNewDelhi, QIBus_lbl_date));
  mRecentSearchList.add(new QIBusBookingModel(QIBus_lbl_MumbaiToSurat, QIBus_lbl_date));
  mRecentSearchList.add(new QIBusBookingModel(QIBus_lbl_DelhiToMubai, QIBus_lbl_date));
  mRecentSearchList.add(new QIBusBookingModel(QIBus_lbl_MumbaiToSurat, QIBus_lbl_date));
  return mRecentSearchList;
}

List<QIBusNewOfferModel> QIBusGetOffer() {
  List<QIBusNewOfferModel> mNewOfferList = List<QIBusNewOfferModel>();
  mNewOfferList.add(new QIBusNewOfferModel(QIBus_lbl_offer1, qibus_ic_sale_1, qIBus_darkBlue));
  mNewOfferList.add(new QIBusNewOfferModel(QIBus_lbl_offer2, qibus_ic_sale_2, qIBus_purple));
  mNewOfferList.add(new QIBusNewOfferModel(QIBus_lbl_offer1, qibus_ic_sale_1, qIBus_darkGreen));
  mNewOfferList.add(new QIBusNewOfferModel(QIBus_lbl_offer2, qibus_ic_sale_2, qIBus_darkBlue));
  mNewOfferList.add(new QIBusNewOfferModel(QIBus_lbl_offer1, qibus_ic_sale_1, qIBus_purple));
  return mNewOfferList;
}

List<QIBusBookingModel> QIBusGetBook() {
  List<QIBusBookingModel> mBookList = List<QIBusBookingModel>();
  mBookList.add(QIBusBookingModel.booking(QIBus_lbl_DelhiToMubai, QIBus_lbl_booking_date1, QIBus_lbl_booking_starttime1, QIBus_lbl_booking_totaltime1, QIBus_lbl_booking_endtime1,
      QIBus_lbl_booking_SeatNo1, QIBus_lbl_booking_passenger_name1, QIBus_lbl_booking_ticketno1, QIBus_lbl_booking_pnr1, QIBus_lbl_booking_totalfare1, QIBus_text_confirmed, qibus_ic_completed));
  mBookList.add(QIBusBookingModel.booking(QIBus_lbl_MumbaiToPune, QIBus_lbl_booking_date2, QIBus_lbl_booking_starttime2, QIBus_lbl_booking_totaltime1, QIBus_lbl_booking_endtime2,
      QIBus_lbl_booking_SeatNo1, QIBus_lbl_booking_passenger_name1, QIBus_lbl_booking_ticketno2, QIBus_lbl_booking_pnr21, QIBus_lbl_booking_totalfare2, QIBus_text_confirmed, qibus_ic_completed));
  return mBookList;
}

List<QIBusBookingModel> QIBusGetCancelBook() {
  List<QIBusBookingModel> mCancelList = List<QIBusBookingModel>();
  mCancelList.add(QIBusBookingModel.booking(QIBus_lbl_MumbaiToPune, QIBus_lbl_booking_date1, QIBus_lbl_booking_starttime1, QIBus_lbl_booking_totaltime1, QIBus_lbl_booking_endtime1,
      QIBus_lbl_booking_SeatNo1, QIBus_lbl_booking_passenger_name1, QIBus_lbl_booking_ticketno1, QIBus_lbl_booking_pnr1, QIBus_lbl_booking_totalfare1, QIBus_txt_cancelled, qibus_ic_canceled));
  return mCancelList;
}

List<QIBusModel> QIBusGetBusList() {
  List<QIBusModel> mBusList = List<QIBusModel>();
  mBusList.add(QIBusModel(
      QIBus_lbl_travel_name, QIBus_lbl_booking_starttime1, QIBus_text_am, QIBus_lbl_booking_endtime1, QIBus_text_pm, QIBus_lbl_totalDuration, QIBus_lbl_hold, QIBus_lbl_type1, 3, QIBus_lbl_price1));
  mBusList.add(QIBusModel(
      QIBus_lbl_travel_name, QIBus_lbl_booking_starttime1, QIBus_text_am, QIBus_lbl_booking_endtime1, QIBus_text_pm, QIBus_lbl_totalDuration, QIBus_lbl_hold, QIBus_lbl_type1, 3, QIBus_lbl_price2));
  mBusList.add(QIBusModel(
      QIBus_lbl_travel_name, QIBus_lbl_booking_starttime1, QIBus_text_am, QIBus_lbl_booking_endtime1, QIBus_text_pm, QIBus_lbl_totalDuration, QIBus_lbl_hold, QIBus_lbl_type2, 3, QIBus_lbl_price1));
  return mBusList;
}

List<QIBusBookingModel> QIBusGetNotification() {
  List<QIBusBookingModel> mNotificationList = List<QIBusBookingModel>();
  mNotificationList.add(QIBusBookingModel.booking(QIBus_lbl_DelhiToMubai, QIBus_lbl_booking_duration1, QIBus_lbl_booking_starttime1, QIBus_lbl_booking_totaltime1, QIBus_lbl_booking_endtime1,
      QIBus_lbl_booking_SeatNo1, QIBus_lbl_booking_passenger_name1, QIBus_lbl_booking_ticketno1, QIBus_lbl_booking_pnr1, QIBus_lbl_booking_totalfare1, QIBus_text_confirmed, qibus_ic_completed));
  mNotificationList.add(QIBusBookingModel.booking(QIBus_lbl_MumbaiToPune, QIBus_lbl_booking_duration2, QIBus_lbl_booking_starttime2, QIBus_lbl_booking_totaltime1, QIBus_lbl_booking_endtime2,
      QIBus_lbl_booking_SeatNo1, QIBus_lbl_booking_passenger_name1, QIBus_lbl_booking_ticketno2, QIBus_lbl_booking_pnr21, QIBus_lbl_booking_totalfare2, QIBus_text_confirmed, qibus_ic_completed));
  return mNotificationList;
}

List<QIBusSeatModel> QIBusSeat() {
  List<QIBusSeatModel> mNotificationList = List<QIBusSeatModel>();
  for (int i = 0; i <= 5; i++) {
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.BOOKED, 2));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.LADIES, 3));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
  }
  return mNotificationList;
}

List<QIBusCardModel> QIBusGetCards() {
  List<QIBusCardModel> mCardList = List<QIBusCardModel>();
  mCardList.add(QIBusCardModel(
      QIBus_lbl_card_type2, qibus_ic_card, QIBus_lbl_card_digit1, QIBus_lbl_card_digit2, QIBus_lbl_card_digit3, QIBus_lbl_card_digit4, QIBus_lbl_card_validdate1, QIBus_lbl_booking_passenger_name1));
  mCardList.add(QIBusCardModel(
      QIBus_lbl_card_type2, qibus_ic_card3, QIBus_lbl_card_digit2, QIBus_lbl_card_digit4, QIBus_lbl_card_digit1, QIBus_lbl_card_digit3, QIBus_lbl_card_validdate1, QIBus_lbl_booking_passenger_name1));
  return mCardList;
}

List<QIBusCardModel> QIBusGetPayment() {
  List<QIBusCardModel> mCardList = List<QIBusCardModel>();
  mCardList.add(QIBusCardModel(
      QIBus_lbl_card_type2, qibus_ic_card3, QIBus_lbl_card_digit2, QIBus_lbl_card_digit4, QIBus_lbl_card_digit1, QIBus_lbl_card_digit3, QIBus_lbl_card_validdate1, QIBus_lbl_booking_passenger_name1));
  return mCardList;
}

List<QIBusDroppingModel> QIBusGetPickUp() {
  List<QIBusDroppingModel> mPickUpList = List<QIBusDroppingModel>();
  mPickUpList.add(QIBusDroppingModel(QIBus_lbl_pickup1, QIBus_lbl_location1, QIBus_lbl_duration1));
  mPickUpList.add(QIBusDroppingModel(QIBus_lbl_pickup2, QIBus_lbl_location1, QIBus_lbl_duration1));
  return mPickUpList;
}

List<QIBusDroppingModel> QIBusGetDroppingPoint() {
  List<QIBusDroppingModel> mDroppingList = List<QIBusDroppingModel>();
  mDroppingList.add(QIBusDroppingModel(QIBus_lbl_dropping1, QIBus_lbl_location1, QIBus_lbl_duration1));
  mDroppingList.add(QIBusDroppingModel(QIBus_lbl_dropping2, QIBus_lbl_location1, QIBus_lbl_duration1));
  return mDroppingList;
}

List<QIBusNewPackageModel> QIBusGetPackage() {
  List<QIBusNewPackageModel> mPackageList = List<QIBusNewPackageModel>();
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_goa, QIBus_lbl_package_duration1, QIBus_lbl_package_rate1, QIBus_lbl_package_price1, QIBus_lbl_package_booking1, qibus_ic_goa));
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_amritsar, QIBus_lbl_package_duration2, QIBus_lbl_package_rate3, QIBus_lbl_package_price2, QIBus_lbl_package_bookin2, qibus_ic_amritsar));
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_andaman, QIBus_lbl_package_duration3, QIBus_lbl_package_rate5, QIBus_lbl_package_price3, QIBus_lbl_package_booking3, qibus_ic_andamans));
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_delhi, QIBus_lbl_package_duration1, QIBus_lbl_package_rate4, QIBus_lbl_package_price4, QIBus_lbl_package_booking1, qibus_ic_delhi));
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_shimla, QIBus_lbl_package_duration1, QIBus_lbl_package_rate4, QIBus_lbl_package_price5, QIBus_lbl_package_bookin2, qibus_ic_temp));
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_udaipur, QIBus_lbl_package_duration2, QIBus_lbl_package_rate5, QIBus_lbl_package_price1, QIBus_lbl_package_booking1, qibus_ic_udaipur));
  return mPackageList;
}

List<QIBusNewPackageModel> QIBusGetPackageList() {
  List<QIBusNewPackageModel> mPackageList = List<QIBusNewPackageModel>();
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_amritsar, QIBus_lbl_package_duration2, QIBus_lbl_package_rate3, QIBus_lbl_package_price2, QIBus_lbl_package_bookin2, qibus_ic_amritsar));
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_delhi, QIBus_lbl_package_duration1, QIBus_lbl_package_rate4, QIBus_lbl_package_price4, QIBus_lbl_package_booking1, qibus_ic_delhi));
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_udaipur, QIBus_lbl_package_duration2, QIBus_lbl_package_rate5, QIBus_lbl_package_price1, QIBus_lbl_package_booking1, qibus_ic_udaipur));
  return mPackageList;
}
