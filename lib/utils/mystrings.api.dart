class StringUrlAPIs {
  static const baseurl = "http://192.168.101.58:8090/api/";
  static const baseurl_feedback = "http://192.168.101.57:8092/";
  static const point_cardtrack = "${baseurl}point_by_date_cardtrack";
  static const point_cardtrack_fullinfor = "${baseurl}point_by_date_cardtrack_fullinfor";
  static const point_cardtrack_range = "${baseurl}point_by_date_cardtrack/range";
  
  static const point_dates = "${baseurl}point_by_date";
  static const point_dates_range = "${baseurl}point_by_date/range";
  static const point_id = "point/"; //WITH ID BEHIND 
  static const point_cardnumber = "card_number/"; //WITH ID BEHIND 

		static const create_feedBack = "${baseurl_feedback}add_rate";
		static const list_feedback = "${baseurl_feedback}list_rate";
    static const findDateFrame = "${baseurl}dateframe_by_number";

}
