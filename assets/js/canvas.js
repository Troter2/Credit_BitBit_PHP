class PhotoDAW {
    constructor(base, coords) {
        this.FirstDate;
        this.ctx;
        this.divId = base;
        this.forma = "linea";
        this.canvas;
        this.firstOrSecond = true;
        this.LineColor = "#000000";
        this.FillColor = "#000000";
        this.firtsClickX;
        this.firtsClickY;
        this.secondClickX;
        this.secondClickY;
        if (coords == true) {
            this.coords = coords;
        } else {
            this.coords = false;
        }
        this.createDiv = this.createDiv.bind(this);
        this.moveMouse = this.moveMouse.bind(this);
        this.oMousePos = this.oMousePos.bind(this);
        this.paint = this.paint.bind(this);
        this.setLine = this.setLine.bind(this);
        this.setCircle = this.setCircle.bind(this);
        this.setCircleFill = this.setCircleFill.bind(this);
        this.setSquare = this.setSquare.bind(this);
        this.setSquareFill = this.setSquareFill.bind(this);
        this.setSquareClear = this.setSquareClear.bind(this);
        this.setText = this.setText.bind(this);
        this.save = this.save.bind(this);
        this.clear = this.clear.bind(this);
        this.createDiv(base);
    }
    loadImatge(imgbase64) {
        var image = new Image();
        image.src = imgbase64;
        this.ctx.drawImage(image, 0, 0);
    }

    createDiv() {
        //genera el canvas, amb els botons i tot
        var x = document.createElement("CANVAS");
        x.id = "canvas1";
        x.style = "border:1px solid #000000";
        x.height = 300;
        x.width = 300;

        document.getElementById(this.divId).appendChild(x);


        this.canvas = document.getElementById("canvas1");
        this.ctx = this.canvas.getContext("2d");
        if (this.ctx) {

            this.canvas.addEventListener("click", this.paint);

            this.canvas.addEventListener("mousemove", this.moveMouse, false);

            this.canvas.addEventListener("mouseout", function(evt) {
                this.limpiarCoords;
            }, false);
        }


        let input = document.createElement("p");
        input.innerHTML = "Linea";
        input.id = "linea";
        input.classList = "btn btn-primary ml-4";
        document.getElementById(this.divId).appendChild(input);
        document.getElementById("linea").addEventListener("click", this.setLine);

        input = document.createElement("p");
        input.innerHTML = '<i class="fa fa-circle-thin" aria-hidden="true"></i>';
        input.id = "Cercle";
        input.classList = "btn btn-primary ml-4";
        document.getElementById(this.divId).appendChild(input);
        document.getElementById("Cercle").addEventListener('click', this.setCircle);

        input = document.createElement("p");
        input.innerHTML = '<i class="fa fa-circle" aria-hidden="true"></i>';
        input.id = "Cercle_ple";
        input.classList = "btn btn-primary ml-4";
        document.getElementById(this.divId).appendChild(input);
        document.getElementById("Cercle_ple").addEventListener('click', this.setCircleFill);

        input = document.createElement("p");
        input.innerHTML = '<i class="fa fa-square-o" aria-hidden="true"></i>';
        input.id = "Cuadrat";
        input.classList = "btn btn-primary ml-4";
        document.getElementById(this.divId).appendChild(input);
        document.getElementById("Cuadrat").addEventListener('click', this.setSquare);

        input = document.createElement("p");
        input.innerHTML = '<i class="fa fa-square" aria-hidden="true"></i>';
        input.id = "Cuadrat_fill";
        input.classList = "btn btn-primary ml-4";
        document.getElementById(this.divId).appendChild(input);
        document.getElementById("Cuadrat_fill").addEventListener('click', this.setSquareFill);

        input = document.createElement("p");
        input.innerHTML = "Borrar sector";
        input.id = "Cuadrat_clear";
        input.classList = "btn btn-primary ml-4";
        document.getElementById(this.divId).appendChild(input);
        document.getElementById("Cuadrat_clear").addEventListener('click', this.setSquareClear);

        input = document.createElement("p");
        input.innerHTML = "save";
        input.id = "save";
        input.classList = "btn btn-primary ml-4";
        document.getElementById(this.divId).appendChild(input);
        document.getElementById("save").addEventListener('click', this.save);

        input = document.createElement("p");
        input.innerHTML = '<i class="fa fa-eraser" aria-hidden="true"></i>';
        input.id = "clear";
        input.classList = "btn btn-primary ml-3";
        document.getElementById(this.divId).appendChild(input);
        document.getElementById("clear").addEventListener('click', this.clear);




        input = document.createElement("input");
        input.classList = "ml-3";
        input.type = "text";
        input.id = "text_input";
        input.placeholder = "Text a introduir"
        document.getElementById(this.divId).appendChild(input);

        input = document.createElement("p");
        input.innerHTML = "Generar text";
        input.id = "text";
        input.classList = "btn btn-primary ml-3";
        document.getElementById(this.divId).appendChild(input);
        document.getElementById("text").addEventListener('click', this.setText);

        input = document.createElement("label");
        input.classList = "ml-3";
        input.innerHTML = "Color Linea";
        document.getElementById(this.divId).appendChild(input);

        input = document.createElement("input");
        input.classList = "ml-3";
        input.type = "color";
        input.id = "lineColor";
        document.getElementById(this.divId).appendChild(input);


        input = document.createElement("label");
        input.classList = "ml-3";
        input.innerHTML = "Color Relleno";
        document.getElementById(this.divId).appendChild(input);


        input = document.createElement("input");
        input.classList = "ml-3";
        input.type = "color";
        input.id = "fillColor";
        document.getElementById(this.divId).appendChild(input);

        input = document.createElement("label");
        input.classList = "ml-3";
        input.innerHTML = "Grossor de linea";
        document.getElementById(this.divId).appendChild(input);

        input = document.createElement("input");
        input.classList = "ml-3";
        input.id = "weight";
        input.type = "number";
        input.min = "1";
        input.value = "1";
        input.max = "20";
        input.step = "1";
        document.getElementById(this.divId).appendChild(input);


    }


    oMousePos(evt) {
        //agafa la posicio del ratoli
        var ClientRect = this.canvas.getBoundingClientRect();
        return { //objeto
            x: Math.round(evt.clientX - ClientRect.left),
            y: Math.round(evt.clientY - ClientRect.top)
        }
    }

    paint(evt) {
        this.mousePos = this.oMousePos(evt);
        //si es el primer clic agafa les coordenades 
        if (this.firstOrSecond == true) {
            this.firtsClickX = this.mousePos.x;
            this.firtsClickY = this.mousePos.y;
            this.firstOrSecond = false;
            if (this.forma == "Text") {
                this.firstOrSecond = true;
                this.ctx.fillStyle = "#fff";
                this.ctx.fillRect(0, 0, 215, 40);
                this.ctx.fillStyle = "#000";
                this.ctx.font = "30px Arial";
                this.ctx.fillText(document.getElementById("text_input").value, this.firtsClickX, this.firtsClickY);

                this.ctx.stroke();
            }
            //si es el segon clic agafa les segones coordenades
        } else {
            this.secondClickX = this.mousePos.x;
            this.secondClickY = this.mousePos.y;
            //si la forma seleccionada es linea entra i pinta una linea amb el color seleccionat l'ample seleccionat
            if (this.forma == "linea") {
                this.firstOrSecond = true;
                this.ctx.lineWidth = document.getElementById("weight").value;
                this.ctx.strokeStyle = document.getElementById("lineColor").value;
                this.ctx.beginPath();
                this.ctx.moveTo(this.firtsClickX, this.firtsClickY);
                this.ctx.lineTo(this.secondClickX, this.secondClickY);
                this.ctx.stroke();
            } else if (this.forma == "Cercle_ple") {

                //si la forma seleccionada es cercl entra i pinta uncercl amb el color de linea seleccionat, l'interior amb el color seleccionat i l'ample seleccionat
                this.firstOrSecond = true;
                //calcula el radi
                let radius = Math.sqrt((this.firtsClickX - this.secondClickX) * (this.firtsClickX - this.secondClickX) + (this.firtsClickY - this.secondClickY) * (this.firtsClickY - this.secondClickY));

                this.ctx.lineWidth = document.getElementById("weight").value;
                this.ctx.beginPath();
                this.ctx.arc(this.firtsClickX, this.firtsClickY, radius, 0, 2 * Math.PI);
                this.ctx.strokeStyle = document.getElementById("lineColor").value;
                this.ctx.fillStyle = document.getElementById("fillColor").value;
                this.ctx.fill();
                this.ctx.stroke();
            } else if (this.forma == "Cercle") {

                //si la forma seleccionada es cercl entra i pinta uncercl amb el color de linea seleccionat, l'interior amb el color seleccionat i l'ample seleccionat
                this.firstOrSecond = true;
                //calcula el radi
                let radius = Math.sqrt((this.firtsClickX - this.secondClickX) * (this.firtsClickX - this.secondClickX) + (this.firtsClickY - this.secondClickY) * (this.firtsClickY - this.secondClickY));

                this.ctx.lineWidth = document.getElementById("weight").value;
                this.ctx.beginPath();
                this.ctx.arc(this.firtsClickX, this.firtsClickY, radius, 0, 2 * Math.PI);
                this.ctx.strokeStyle = document.getElementById("lineColor").value;
                this.ctx.stroke();
            } else if (this.forma == "Cuadrat") {
                this.firstOrSecond = true;
                this.ctx.lineWidth = document.getElementById("weight").value;
                this.ctx.strokeStyle = document.getElementById("lineColor").value;
                this.ctx.beginPath();
                this.ctx.strokeRect(this.firtsClickX, this.firtsClickY, this.secondClickX - this.firtsClickX, this.secondClickY - this.firtsClickY);
                this.ctx.stroke();
            } else if (this.forma == "Cuadrat_ple") {
                this.firstOrSecond = true;
                this.ctx.lineWidth = document.getElementById("weight").value;
                this.ctx.strokeStyle = document.getElementById("lineColor").value;
                this.ctx.beginPath();
                this.ctx.fillRect(this.firtsClickX, this.firtsClickY, this.secondClickX - this.firtsClickX, this.secondClickY - this.firtsClickY);


                this.ctx.stroke();
            } else if (this.forma == "Cuadrat_clear") {
                this.firstOrSecond = true;
                this.ctx.beginPath();
                this.ctx.clearRect(this.firtsClickX, this.firtsClickY, this.secondClickX - this.firtsClickX, this.secondClickY - this.firtsClickY);

            } else if (this.forma == "Text") {
                this.firstOrSecond = true;
                this.ctx.fillStyle = "#fff";
                this.ctx.fillRect(0, 0, 215, 40);
                this.ctx.fillStyle = "#000";
                this.ctx.font = "30px Arial";
                this.ctx.fillText(document.getElementById("text_input").value, this.firtsClickX, this.firtsClickY);

                this.ctx.stroke();
            }
        }
    }




    setLine() {
        this.forma = "linea";
        this.firstOrSecond = true;
    }
    save() {
        let img = this.canvas.toDataURL();
        console.log(img);

        this.firstOrSecond = true;
    }
    setCircle() {
        this.forma = "Cercle";
        this.firstOrSecond = true;
    }
    setCircleFill() {
        this.forma = "Cercle_ple";
        this.firstOrSecond = true;
    }
    setSquare() {
        this.forma = "Cuadrat";
        this.firstOrSecond = true;
    }
    setSquareFill() {
        this.forma = "Cuadrat_ple";
        this.firstOrSecond = true;
    }
    setSquareClear() {
        this.forma = "Cuadrat_clear";
        this.firstOrSecond = true;
    }
    setText() {
        this.forma = "Text";
        this.firstOrSecond = true;
    }
    clear() {
        this.firstOrSecond = true;
        this.ctx.beginPath();
        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
    }

    moveMouse(evt) {
        this.mousePos = this.oMousePos(evt);
    }
}