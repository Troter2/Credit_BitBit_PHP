<div class="login-div align-self-center">


    <div class="card p-4 col col-sm-10 col-md-8 m-auto">
        <form>
            <div id="contentForm">
                <label>Marca de l'ordinador</label>
                <select class="form-control" id="chosenBrandPC">
                    <option>Acer</option>
                    <option>HP</option>
                    <option>MAC</option>
                    <option>Lenovo</option>
                    <option>MSI</option>
                </select>
                <label>Model de la maquina</label>
                <input class="form-control" type="text" value="" /><br />
                <label>Codi client</label>
                <input class="form-control" type="text" value="" /><br />
                <label for="remember">Descripció del error</label>
                <textarea class="form-control" id="errorDescription" rows="3"></textarea>
                <br>
                <label>Diagnosi previ</label>
                <textarea class="form-control" id="diagnosiPrevi" rows="3"></textarea>
                <br />
                <br />
                <div class="card">
                    <label class="col">Material utilitzat</label>
                    <input class="form-control" type="text" value="" />
                    <br />
                    <label class="col">Cantitat utilitzada</label>
                    <input class="form-control" type="text" value="" />
                    <div class="d-flex justify-content-center">
                        <input class="btn btn-outline-dark" type="submit" name="submit" value="+" />
                    </div>
                </div>
                <br />
                <label>Descripeció de la tasca</label>
                <input class="form-control" type="text" value="" />
                <div class="d-flex justify-content-center">
                    <input class="btn btn-outline-dark" type="submit" name="submit" value="+" />
                </div>

                <br />

                <div class="card">
                    <label>Afegir documents</label>
                    <div class="d-flex justify-content-center">
                        <input class="btn btn-outline-dark" type="submit" name="submit" value="+" />
                    </div>
                </div>
            </div>
        </form>
        <input class="btn btn btn-primary mt-3" type="submit" name="submit" value="Afegir tasca" />
    </div>
</div>