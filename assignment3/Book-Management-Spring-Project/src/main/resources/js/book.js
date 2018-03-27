function PreviewImage() {
    var oFReader = new FileReader();
    oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

    oFReader.onload = function (oFREvent) {
        document.getElementById("bookCoverImage").src = oFREvent.target.result;
    };
};

$('#bookCoverImage').on('click', function(){
    $('#uploadImage').trigger('click');
});