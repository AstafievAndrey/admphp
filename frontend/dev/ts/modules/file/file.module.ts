import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { fileRouting}  from './file.routing';
import { FormsModule }      from '@angular/forms';
         
import { FileComponent }   from './file.component';
import { LoadFileComponent }   from './components/loadFile.component';

@NgModule({
    imports:      [ 
        BrowserModule,
        FormsModule,
        fileRouting 
    ],
    declarations: [ 
        FileComponent,
        LoadFileComponent
    ],
    providers: [
        
    ],
    bootstrap:    [ FileComponent ],
})

export class FileModule { }
