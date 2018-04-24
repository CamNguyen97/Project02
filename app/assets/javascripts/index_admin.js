$("#dataTable").dataTable();
$(".btn-movies").click(function() {
    window.location.href = "/admin/movies/new";
 });
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