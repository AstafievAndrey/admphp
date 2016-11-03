import { Component } from '@angular/core';

@Component({
    selector:'<load-file></load-file>',
    templateUrl:'app/html/loadFile.component.html'
})

export class LoadFileComponent { 
    
    file:File;
    
    constructor(){}
    
    fileChange(fl: any){
        if(fl.target.files[0]!==undefined){
            this.file = fl.target.files[0];
        } 
    }
    
    onSubmit(){
        this.makeFileRequest("http://localhost/fed/adm/index.php", [], this.file).then((result) => {
            console.log(result);
        }, (error) => {
            console.error(error);
        });
    }
    
    makeFileRequest(url: string, params: Array<string>, file: File) {
        return new Promise((resolve, reject) => {
            var formData: any = new FormData();
            var xhr = new XMLHttpRequest();
            formData.append("file", file, file.name);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        resolve(JSON.parse(xhr.response));
                    } else {
                        reject(xhr.response);
                    }
                }
            }
            xhr.open("POST", url, true);
            xhr.send(formData);
        });
    }
    
}