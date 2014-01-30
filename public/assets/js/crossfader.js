var images = ["flower_cake.jpg", "caprese.jpg", "tortellini.jpg", "chocolate.jpg", "bagels.jpg", "dinner.jpg"],
    imageInId = '#main_image_0',
    imageOutId = '#main_image_1',
    activeImage = 0,
    imageCounter = 0,
    imageIndex = 0;

function animate(){
  $(imageInId).fadeIn(500);
  $(imageOutId).fadeOut(500);
}

function next(){
  imageCounter ++;
  activeImage ++;
  imageIndex = imageCounter % images.length;

  imageInId = "#main_image_" + (activeImage % 2);
  imageOutId = "#main_image_" + ((activeImage + 1) % 2);

  $(imageInId).attr("src", "/assets/images/" + images[imageIndex]);
  animate();
}

setInterval(next, 7000)
