var fs= require('fs');
var cv = require('opencv');
const __DIR='./images/faces/';
const __DIR_DESTINY='./images/FACE_PROFILE/';
var filesDirects=[],i=0;
fs.readdir(__DIR, function(error,files){
	if(error){
		throw new Error(error);
	}
	filesDirects=files;
	readFile();
});
function readFile(){
	if(filesDirects[i]){
		cv.readImage(__DIR+filesDirects[i], function(err, im) {
				  if (err) throw err;
				  if (im.width() < 1 || im.height() < 1) throw new Error('Image has no size');
				  im.detectObject('./Tools/haarcascade_profileface.xml', {}, function(err, faces) {
				    if (!err){
					    for (var j = 0,m=faces.length; j < m; j++) {
					      	face = faces[j];
					    	var img = im.crop(face.x, face.y, face.width, face.height);				    	
					    	img.save(__DIR_DESTINY+j+"_"+filesDirects[i]);
					    	console.log("Image saved to "+__DIR_DESTINY+j+"_"+filesDirects[i]);
					    }				    	
				    }
				    i++;
				    readFile();
				  });
		});
	}
}