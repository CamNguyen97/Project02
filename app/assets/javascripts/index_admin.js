$("#dataTable").dataTable();
function readURL(input) {

  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function(e) {
      $('.menu_icon').attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}
$("#movie_image").change(function() {
  readURL(this);
});

// view seat

$("#cinemaroom").change(function(){
	SeatGetdata();
});

function SeatGetdata(){
  var client_id = $("select#cinemaroom :selected").val();
  if (client_id == "") {client_id = "1";}
  $.ajax({
    url: '/admin/seats/' + client_id + "/seatGet",
    type: 'GET',
    success: function(data) {
     if(data.seat != true){
    	 view_seat(data);
      }else{
        view_seat_data(data);
      }
    }
   });
}
function view_seat_data(data){
  var column ="";
  var row = "";
  var i = 0;
  for (var i = data.sum_of_row - 1; i >= 0; i--) {
    for (var j = data.sum_of_collum - 1; j >= 0; j--) {
      for (var k = 0; k < data.seats.length; k++) {
      var chr = String.fromCharCode(97 + i).toUpperCase();
      if(data.seats[k].seat_type_id == 1 && data.seats[k].status == true && parseInt(data.seats[k].num_of_row) == i && data.seats[k].num_of_collum == j){
        
        column +="<div class='col-seat seat default-seat seat-checked' data-value ='"+(j+1)+"' seat-type='' status = '' onclick = 'selectseat(this)' >"+chr+""+(j+1)+"</div>";
      }
      if(data.seats[k].seat_type_id == 1 && data.seats[k].status == false && parseInt(data.seats[k].num_of_row) == i && data.seats[k].num_of_collum == j){
        // console.log(column);
        column +="<div class='col-seat seat default-seat unactive' data-value ='"+(j+1)+"' seat-type='' status = '' onclick = 'selectseat(this)' >"+chr+""+(j+1)+"</div>";
      }
      if(data.seats[k].seat_type_id == 2 && data.seats[k].status == false && parseInt(data.seats[k].num_of_row) == i && data.seats[k].num_of_collum == j){
        // console.log(column);
        column +="<div class='col-seat seat default-seat seat-checked-vip' data-value ='"+(j+1)+"' seat-type='' status = '' onclick = 'selectseat(this)' >"+chr+""+(j+1)+"</div>";
      }
      if(data.seats[k].seat_type_id == 2 && data.seats[k].status == false && parseInt(data.seats[k].num_of_row) == i && data.seats[k].num_of_collum == j){
        // console.log(column);
        column +="<div class='col-seat seat default-seat unactive' data-value ='"+(j+1)+"' seat-type='' status = '' onclick = 'selectseat(this)' >"+chr+""+(j+1)+"</div>";
      }
    }
    }
     row += "<div class = 'row row-seat' data-value ='"+i+"' >"+column+"</div></br>"
     column = "";
  }
 $(".content-seat").html(row);
}

function view_seat(data){
  var column ="";
  var row = "";
  for (var i = data.sum_of_row - 1; i >= 0; i--) {
    for (var j = data.sum_of_collum - 1; j >= 0; j--) {
      var chr = String.fromCharCode(97 + i).toUpperCase();
      column +="<div class='col-seat seat' data-value ='"+(j+1)+"' seat-type='' status = '' onclick = 'selectseat(this)' >"+chr+""+(j+1)+"</div>";
    }
     row += "<div class = 'row row-seat' data-value ='"+i+"' >"+column+"</div></br>"
     column = "";
  }
 $(".content-seat").html(row);
}
function selectseat(value){
  var client_id = $("select#Seat_type :selected").val();
  var status = $("select#status :selected").val();
  if (client_id == ""){alert("Choose seat type")}
  if (client_id == ""){alert("Choose status")}
  if(client_id == 1 && status == 1){
    $(value).addClass("default-seat");
    $(value).addClass("seat-checked-vip");
    $(value).attr('seat-type', client_id);
    $(value).attr('status', status);
    $(value).removeClass("seat-checked unactive");
  }
  if(client_id == 2 && status == 1){
    $(value).addClass("default-seat");
    $(value).addClass("seat-checked");
    $(value).attr('seat-type', 2);
    $(value).attr('status', status);
    $(value).removeClass("seat-checked-vip unactive");
  }
  if(status == 0 && client_id == 1){
    $(value).addClass("default-seat");
    $(value).addClass("unactive");
    $(value).attr('seat-type', client_id);
    $(value).attr('status', status);
    $(value).removeClass("seat-checked seat-checked-vip");
  }
  if(status == 0 && client_id ==2){
    $(value).addClass("default-seat");
    $(value).addClass("unactive");
    $(value).attr('seat-type', client_id);
    $(value).attr('status', status);
    $(value).removeClass("seat-checked seat-checked-vip");
  }
};

$("#seat_add").click(function(){
  var seattype_id = $("select#Seat_type :selected").val();
  var status = $("select#status :selected").val();
  var cinemaroom_id = $("select#cinemaroom :selected").val();
  var row = $(".row-seat");
  var col = $(".row-seat > .col-seat");
  var pluginArrayArg = [];
   for (var i = 0; i < row.length; i++) {
    for (var j = 0; j < (col.length / row.length); j++) {
      var jsonArg = new Object();
      var col_seat = row[i].childNodes[j].getAttribute("data-value");
      var row_seat = i;
      var status = row[i].childNodes[j].getAttribute("status");
      var seat_type = row[i].childNodes[j].getAttribute("seat-type");
      jsonArg.num_of_row = row_seat;
      jsonArg.num_of_collum = col_seat;
      jsonArg.status = status;
      jsonArg.cinemaroom_id = cinemaroom_id
      jsonArg.seat_type_id = seat_type;
      pluginArrayArg.push(jsonArg);
    }
  }
  var data = JSON.stringify(pluginArrayArg);
  console.log(data);
  $.ajax({
    url: '/admin/seats/',
    type: 'POST',
    // contentType: 'application/json',
    data:{obj: data },
    success: function(data) {
      alert("abc");
   }
});
});
