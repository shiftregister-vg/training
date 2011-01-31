package fileuploaddemo

class FileController {

    def index = { }
    
    def upload = {
    	def f = request.getFile('myFile')
    	if (!f.empty){
    		def file = new File('files/' + f.getOriginalFilename())
    		file.mkdirs()
    		f.transferTo(file)
    		flash.message = "File uploaded!"
    		render(view:'index')
    	} else {
    		flash.message = 'file cannot be empty'
    		render(view:'index')
    	}
    }
}
