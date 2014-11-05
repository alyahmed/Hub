/***************************/
//@Author: Adrian "yEnS" Mato Gondelle & Ivan Guardado Castro
//@website: www.yensdesign.com
//@email: yensamg@gmail.com
//@license: Feel free to use it, but keep this credits please!					
/***************************/

var d = new Date();

var currDate = d.getDate();
var currMonth = d.getMonth();
var currYear = d.getFullYear();

var todayDate = currDate + "-" + currMonth + "-" + currYear;



$(document).ready(function(){
	//global vars
	var form = $("#customForm");
	var name = $("#name");
	var nameInfo = $("#nameInfo");
	
	var trainername = $("#trainername");
	var trainernameInfo = $("#trainernameInfo");
	var infos = $("#infos");
	var infosInfo = $("#infosInfo");
	var infobild = $("#infobild");
	var infobildInfo = $("#infobildInfo");
	var besta = $("#besta");
	var bestaInfo = $("#bestaInfo");
	var freund = $("#freund");
	var freundInfo = $("#freundInfo");
	var face = $("#face");
	var faceInfo = $("#faceInfo");
	var email = $("#email");
	var emailInfo = $("#emailInfo");
	var telefon = $("#telefon");
	var telefonInfo = $("#telefonInfo");
	var email2 = $("#email2");
	var email2Info = $("#email2Info");
	var email3 = $("#email3");
	var email3Info = $("#email3Info");
	var passwordvar = $("#password");
	var passwordInfovar = $("#passwordInfo");
	var oldpassword = $("#oldpassword");
	var oldpasswordInfo = $("#oldpasswordInfo");
	var password1 = $("#password1");
	var password1Info = $("#password1Info");
	var password2 = $("#password2");
	var password2Info = $("#password2Info");
	var fax = $("#fax");
	var faxInfo = $("#faxInfo");
	var web = $("#web");
	var webInfo = $("#webInfo");
	var titel = $("#titel");
	var titelInfo = $("#titelInfo");
	var clubName = $("#clubName");
	var clubNameInfo = $("#clubNameInfo");
	var inhaber = $("#inhaber");
	var inhaberInfo = $("#inhaberInfo");
	var strabe = $("#strabe");
	var strabeInfo = $("#strabeInfo");
	var plz = $("#plz");
	var ort = $("#ort");
	var plzortInfo = $("#plzortInfo");
	var von =$("#von");
	var vonInfo =$("#vonInfo");
	var bis =$("#bis");
	var bisInfo =$("#bisInfo");
	var vali =$("#vali");
	var valiInfo =$("#valiInfo");
	var price = $("#price");
	var priceInfo = $("#priceInfo");
	var prefix = $('input:radio[name="prefix"]');
	var prefixInfo = $("#prefixInfo");
	var payment = $('input:radio[name="payment"]');
	var paymentInfo = $("#paymentInfo");
	var terms = $("#terms");
	var termsInfo = $("#termsInfo");
	
	//On blur
	email.blur(validateEmail);
	titel.blur(validateTitel);
	name.blur(validateName);
	trainername.blur(validateTrainer);
	infos.blur(validateInfos);
	freund.blur(validateFreund);
	face.blur(validateFace);
	infobild.blur(validateInfobild);
	besta.blur(validateBesta);
	passwordvar.blur(validatePass1);
	password1.blur(validatePass);
	password2.blur(validatePass2);
	oldpassword.blur(validateOldPass);
	fax.blur(validateFax);
	email2.blur(validateEmail2);
	email3.blur(validateEmail3);
	telefon.blur(validateTelefon);
	web.blur(validateWeb);
	clubName.blur(validateClubName);
	strabe.blur(validateStrabe);
	inhaber.blur(validateInhaber);
	plz.blur(validatePlz);
	ort.blur(validateOrt);
	von.blur(validateVon);
	bis.blur(validateBis);
	vali.blur(validateVali);
	price.blur(validatePrice);
	
	//On key press
	email.keyup(validateEmail);
	passwordvar.keyup(validatePass1);
	fax.keyup(validateFax);
	email2.keyup(validateEmail2);
	email3.keyup(validateEmail3);
	telefon.keyup(validateTelefon);
	web.keyup(validateWeb);
	clubName.keyup(validateClubName);
	strabe.keyup(validateStrabe);
	inhaber.keyup(validateInhaber);
	plz.keyup(validatePlz);
	ort.keyup(validateOrt);
	name.keyup(validateName);
	infos.keyup(validateInfos);
	infobild.keyup(validateInfobild);
	besta.keyup(validateBesta);
	freund.keyup(validateFreund);
	face.keyup(validateFace);
	titel.keyup(validateTitel);
	password1.keyup(validatePass);
	password2.keyup(validatePass2);
	oldpassword.keyup(validateOldPass);
	trainername.keyup(validateTrainer);
	price.keyup(validatePrice);
	terms.keyup(validateTerms);
	//On Submitting
/*	form.submit(function(){
		if(validateName() & validatePass1())
			return true
		else
			return false;
	});*/
	$("#login-btn").click(function(){
		if(validateEmail() & validatePass1())
			return true
		else
			return false;
	});
	
	$("#forget-btn").click(function(){
		if(validateEmail2())
			return true
		else
			return false;
	});
	
	$("#submitform").click(function(){
		if(validateEmail3() & validateTelefon()  & validateName())
			return true
		else
			return false;
	});
	$("#submitform1").click(function(){
		if(validateEmail3() & validateName())
			return true
		else
			return false;
	});
	
	$("#submitangebote").click(function(){
		if(validateName() & validateInfos() & validateBesta() & validateVon() & validateBis())
			return true
		else
			return false;
	});
	$("#submitfitness").click(function(){
		if(validateName())
			return true
		else
			return false;
	});
	$("#submitwellness").click(function(){
		if(validateTelefon())
			return true
		else
			return false;
	});
	$("#submitbeauty").click(function(){
		if(validateClubName())
			return true
		else
			return false;
	});
	$("#abortangebote").click(function(){
			name.removeClass("error");
			nameInfo.text("");
			infos.removeClass("error");
			infosInfo.text("");
			$("#infos").cleditor()[0].$area.val('');
			$("#infos").cleditor()[0].updateFrame();
			$("#besta").cleditor()[0].$area.val('');
			$("#besta").cleditor()[0].updateFrame();
			besta.removeClass("error");
			bestaInfo.text("");
			$("#datepicker").datepicker('setValue', todayDate);
			$("#datepicker2").datepicker('setValue', todayDate);
			$("#datepicker4").datepicker('setValue', todayDate);
	});
	$("#submitpush").click(function(){
		if(validateName())
			return true
		else
			return false;
	});
	$("#submitkursplan").click(function(){
		if(validateName() & validateInfos() & validateFace() & validateTrainer())
			return true
		else
			return false;
	});
	$("#abortkursplan").click(function(){
			name.removeClass("error");
			nameInfo.text("");
			infos.removeClass("error");
			infosInfo.text("");
			faceInfo.text("");
			
			face.removeClass("error");
			trainername.removeClass("error");
			trainernameInfo.text("");
	});
	$("#submitkurse").click(function(){
		if(validateName())
			return true
		else
			return false;
	});
	$("#abortkurse").click(function(){
			name.removeClass("error");
			nameInfo.text("");
			infos.removeClass("error");
			infosInfo.text("");
			besta.removeClass("error");
			bestaInfo.text("");
			$("#face").cleditor()[0].$area.val('');
			$("#face").cleditor()[0].updateFrame();
			faceInfo.text("");
			face.removeClass("error");
			$("#besta").cleditor()[0].$area.val('');
			$("#besta").cleditor()[0].updateFrame();
	});
	$("#submitnews").click(function(){
		if(validateName() & validateVali())
			return true
		else
			return false;
	});
	$("#abortnews").click(function(){
			name.removeClass("error");
			nameInfo.text("");
			$("#infos").cleditor()[0].$area.val('');
			$("#infos").cleditor()[0].updateFrame();
			infos.removeClass("error");
			infosInfo.text("");
			$("#datepicker").datepicker('setValue', todayDate);
		
	});
	$("#submitnewsweb").click(function(){
		if(validateName() )
			return true
		else
			return false;
	});
	$("#abortnewsweb").click(function(){
			name.removeClass("error");
			nameInfo.text("");
			$("#infos").cleditor()[0].$area.val('');
			$("#infos").cleditor()[0].updateFrame();
			infos.removeClass("error");
			infosInfo.text("");
			$("#datepicker").datepicker('setValue', todayDate);
			$("#datepicker2").datepicker('setValue', todayDate);
			$("#datepicker4").datepicker('setValue', todayDate);
	});
	$("#submitfriertage").click(function(){
		if(validateName() & validateVali())
			return true
		else
			return false;
	});
	$("#submitgalerie").click(function(){
		if(validateName())
			return true
		else
			return false;
	});
	$("#submitgalerie2").click(function(){
		if(validateTitel())
			return true
		else
			return false;
	});
	$("#submitpassword").click(function(){
		if(validateOldPass() & validatePass())
			return true
		else
			return false;
	});
	$("#submitshop").click(function(){
		if(validateName() & validateTrainer() & validateStrabe() & validatePlz() & validateInhaber() & validateTelefon() & validateEmail() &  validatePrefix() & validatePayment() & validateTerms()) {
			//alert('all right');
			return true;}
		else {
			//alert('error exists');
			return false;
		}
			
	});
	$("#submitshop1").click(function(){
		if(validateEmail()) {
			//alert('all right');
			return true;}
		else {
			//alert('error exists');
			return false;
		}
			
	});
	//validation functions
	function validateEmail(){
		//testing regular expression
		var a = $("#email").val();
		var filter = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
		//if it's valid email
		 if(email.val().length == 0){
			email.addClass("error");
			emailInfo.text("Please enter your e-mail.");
			emailInfo.addClass("error");
			return false;
		}
			else if(filter.test(a)){
			email.removeClass("error");
			emailInfo.text("");
			emailInfo.removeClass("error");
			return true;
		}
		//if it's NOT valid
		else if(!filter.test(a)){
			email.addClass("error");
			emailInfo.text("Please enter a valid e-mail");
			emailInfo.addClass("error");
			return false;
		}
	}
		function validateEmail2(){
		//testing regular expression
		var a = $("#email2").val();
		//var filter = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
		var filter = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
		//if it's valid email
		 if(email2.val().length == 0){
			email2.addClass("error");
			email2Info.text("Please enter your e-mail.");
			email2Info.addClass("error");
			return false;
		}
			else if(filter.test(a)){
			email2.removeClass("error");
			email2Info.text("");
			email2Info.removeClass("error");
			return true;
		}
		//if it's NOT valid
		else if(!filter.test(a)){
			email2.addClass("error");
			email2Info.text("Please enter a valid e-mail");
			email2Info.addClass("error");
			return false;
		}
	}
		function validateEmail3(){
		//testing regular expression
		var a = $("#email3").val();
		//var filter = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
		var filter = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
		//if it's valid email
		 if(email3.val().length == 0){
			email3.addClass("error");
			email3Info.text("Please enter your e-mail.");
			email3Info.addClass("error");
			return false;
		}
			else if(filter.test(a)){
			email3.removeClass("error");
			email3Info.text("");
			email3Info.removeClass("error");
			return true;
		}
		//if it's NOT valid
		else if(!filter.test(a)){
			email3.addClass("error");
			email3Info.text("Please enter a valid e-mail");
			email3Info.addClass("error");
			return false;
		}
	}
	function validateName(){
		//if it's NOT valid
		if(name.val().length == 0){
			name.addClass("error");
			nameInfo.text("This field is required.");
			nameInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			name.removeClass("error");
			nameInfo.text("");
			nameInfo.removeClass("error");
			return true;
		}
	}
	function validateTrainer(){
		//if it's NOT valid
		if(trainername.val().length == 0){
			trainername.addClass("error");
			trainernameInfo.text("This field is required.");
			trainernameInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			trainername.removeClass("error");
			trainernameInfo.text("");
			trainernameInfo.removeClass("error");
			return true;
		}
	}
	function validateTitel(){
		//if it's NOT valid
		if(titel.val().length == 0){
			titel.addClass("error");
			titelInfo.text("This field is required.");
			titelInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			titel.removeClass("error");
			titelInfo.text("");
			titelInfo.removeClass("error");
			return true;
		}
	}
	function validateInfos(){
		//if it's NOT valid
		if(infos.val().length == 0){
			infos.addClass("error");
			infosInfo.text("This field is required.");
			infosInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			infos.removeClass("error");
			infosInfo.text("");
			infosInfo.removeClass("error");
			return true;
		}
	}
	function validateInfobild(){
		//if it's NOT valid
		if(infobild.val().length == 0){
			infobild.addClass("error");
			infobildInfo.text("This field is required.");
			infobildInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			infobild.removeClass("error");
			infobildInfo.text("");
			infobildInfo.removeClass("error");
			return true;
		}
	}
	function validateBesta(){
		//if it's NOT valid
		if(besta.val().length == 0){
			besta.addClass("error");
			bestaInfo.text("This field is required.");
			bestaInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			besta.removeClass("error");
			bestaInfo.text("");
			bestaInfo.removeClass("error");
			return true;
		}
	}
	function validateFreund(){
		//if it's NOT valid
		if(freund.val().length == 0){
			freund.addClass("error");
			freundInfo.text("This field is required.");
			freundInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			freund.removeClass("error");
			freundInfo.text("");
			freundInfo.removeClass("error");
			return true;
		}
	}
	function validateFace(){
		//if it's NOT valid
		if(face.val().length == 0){
			face.addClass("error");
			faceInfo.text("This field is required.");
			faceInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			face.removeClass("error");
			faceInfo.text("");
			faceInfo.removeClass("error");
			return true;
		}
	}
	function validateTelefon(){
		//if it's NOT valid
		if(telefon.val().length == 0){
			telefon.addClass("error");
			telefonInfo.text("This field is required.");
			telefonInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			telefon.removeClass("error");
			telefonInfo.text("");
			telefonInfo.removeClass("error");
			return true;
		}
	}
	function validateFax(){
		//if it's NOT valid
		if(fax.val().length == 0){
			fax.addClass("error");
			faxInfo.text("This field is required.");
			faxInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			fax.removeClass("error");
			faxInfo.text("");
			faxInfo.removeClass("error");
			return true;
		}
	}
	function validateWeb(){
		//if it's NOT valid
		if(web.val().length <= 7){
			web.addClass("error");
			webInfo.text("This field is required.");
			webInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			web.removeClass("error");
			webInfo.text("");
			webInfo.removeClass("error");
			return true;
		}
	}
	function validateClubName(){
		//if it's NOT valid
		if(clubName.val().length == 0){
			clubName.addClass("error");
			clubNameInfo.text("This field is required.");
			clubNameInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			clubName.removeClass("error");
			clubNameInfo.text("");
			clubNameInfo.removeClass("error");
			return true;
		}
	}
	function validateStrabe(){
		//if it's NOT valid
		if(strabe.val().length == 0){
			strabe.addClass("error");
			strabeInfo.text("This field is required.");
			strabeInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			strabe.removeClass("error");
			strabeInfo.text("");
			strabeInfo.removeClass("error");
			return true;
		}
	}
	function validateInhaber(){
		//if it's NOT valid
		if(inhaber.val().length == 0){
			inhaber.addClass("error");
			inhaberInfo.text("This field is required.");
			inhaberInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			inhaber.removeClass("error");
			inhaberInfo.text("");
			inhaberInfo.removeClass("error");
			return true;
		}
	}
	function validatePlz(){
		//if it's NOT valid
		if(plz.val().length == 0){
			plz.addClass("error");
			plzortInfo.text("This field is required.");
			plzortInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			plz.removeClass("error");
			plzortInfo.text("");
			plzortInfo.removeClass("error");
			return true;
		}
	}
	function validateOrt(){
		//if it's NOT valid
		if(ort.val().length == 0){
			ort.addClass("error");
			plzortInfo.text("This field is required.");
			plzortInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			ort.removeClass("error");
			plzortInfo.text("");
			plzortInfo.removeClass("error");
			return true;
		}
	}
	function validateVon(){
		//if it's NOT valid
		if(von.val().length == 0){
			von.addClass("error");
			vonInfo.text("This field is required.");
			vonInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			von.removeClass("error");
			vonInfo.text("");
			vonInfo.removeClass("error");
			return true;
		}
	}
	function validateBis(){
		//if it's NOT valid
		if(bis.val().length == 0){
			bis.addClass("error");
			bisInfo.text("This field is required.");
			bisInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			bis.removeClass("error");
			bisInfo.text("");
			bisInfo.removeClass("error");
			return true;
		}
	}
	function validateVali(){
		//if it's NOT valid
		if(vali.val().length == 0){
			vali.addClass("error");
			valiInfo.text("This field is required.");
			valiInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			vali.removeClass("error");
			valiInfo.text("");
			valiInfo.removeClass("error");
			return true;
		}
	}
	function validatePass1(){
		var a = $("#password");
		var b = $("#password");

		//it's NOT valid
		if(passwordvar.val().length == 0){
			passwordvar.addClass("error");
			passwordInfovar.text("Bitte geben Sie Ihr Passwort");
			passwordInfovar.addClass("error");
			return false;
		}
		//it's valid
		else{			
			passwordvar.removeClass("error");
			passwordInfovar.text("");
			passwordInfovar.removeClass("error");
			return true;
		}
	}
	function validateOldPass(){
		var a = $("#password");
		var b = $("#password");

		//it's NOT valid
		if(oldpassword.val().length == 0){
			oldpassword.addClass("error");
		oldpasswordInfo.text("Geben Sie Ihr altes Passwort");
			oldpasswordInfo.addClass("error");
			return false;
		}
		//it's valid
		else{			
			oldpassword.removeClass("error");
			oldpasswordInfo.text("");
			oldpasswordInfo.removeClass("error");
			return true;
		}
	}
	function validatePass(){
		var a = $("#password1");
		var b = $("#password2");

		//it's NOT valid
		if(password1.val().length == 0){
			password1.addClass("error");
			password1Info.text("This field is required.");
			password1Info.addClass("error");
			return false;
		}
		else if(password1.val().length <= 5){
			password1.addClass("error");
			password1Info.text("Geben Sie über 6 Zeichen");
			password1Info.addClass("error");
			return false;
		}
		//it's valid
		else{			
			password1.removeClass("error");
			password1Info.text("");
			password1Info.removeClass("error");
			validatePass2();
			return true;
		}
	}
	function validatePass2(){
		var a = $("#password1");
		var b = $("#password2");
		if(password2.val().length == 0){
			password2.addClass("error");
			password2Info.text("This field is required.");
			password2Info.addClass("error");
			return false;
		}
		//are NOT valid
		else if( password1.val() != password2.val() ){
			password2.addClass("error");
			password2Info.text("Passwörter stimmen nicht überein");
			password2Info.addClass("error");
			return false;
		}
		//are valid
		else{
			password2.removeClass("error");
			password2Info.text("Passwörter abgestimmt");
			password2Info.removeClass("error");
			return true;
		}
	}
	function validateMessage(){
		//it's NOT valid
		if(message.val().length < 10){
			message.addClass("error");
			return false;
		}
		//it's valid
		else{			
			message.removeClass("error");
			return true;
		}
	}
	function validatePrice(){
		//if it's NOT valid
		if(price.val().length == 0){
			price.addClass("error");
			priceInfo.text("This field is required.");
			priceInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			price.removeClass("error");
			priceInfo.text("");
			priceInfo.removeClass("error");
			return true;
		}
	}
	
	function validateTerms(){
		//if it's NOT valid
		if(!terms.is(":checked")){
			terms.addClass("error");
			termsInfo.text("This field is required.");
			termsInfo.addClass("error");
			//alert('terms not agreed');
			return false;
		}
		//if it's valid
		else{
			terms.removeClass("error");
			termsInfo.text("");
			termsInfo.removeClass("error");
			return true;
		}
	}
	
	function validatePrefix(){
		//if it's NOT valid
		if(prefix.filter(':checked').length	<= 0) {
		//if(!terms.is(":checked")){
			//payment.addClass("error");
			prefixInfo.text("This field is required.");
			prefixInfo.addClass("error");
			//alert('prefix not selected');
			return false;
		}
		//if it's valid
		else{
			//payment.removeClass("error");
			prefixInfo.text("");
			prefixInfo.removeClass("error");
			//alert('prefix selected...go');
			return true;
		}
	}
	
	function validatePayment(){
		//if it's NOT valid
		if(payment.filter(':checked').length	<= 0) {
		//if(!terms.is(":checked")){
			//payment.addClass("error");
			paymentInfo.text("This field is required.");
			paymentInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			//payment.removeClass("error");
			paymentInfo.text("");
			paymentInfo.removeClass("error");
			return true;
		}
	}
});
