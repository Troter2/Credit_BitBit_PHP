<div class="shadow rounded p-4 col col-sm-12 col-md-10 mx-auto mt-3">
    <div class="row col col-sm-12">
        <script src="<?php echo base_url('assets/js/canvas.js'); ?>"></script>
        <?php echo form_open_multipart(base_url('updateInci')); ?>

        <div class="row col col-sm-12 container">


            <div class="col col-sm-3 font-weight-bold">
                <span>Status</span>
            </div>

            <div class="col col-sm-9 text-primary font-weight-bold py-1" style="font-size:18px;">
                <select class="form-control" id="estatus" name="estatus">

                    <?php
                    if (isset($status)) {
                        foreach ($status as $stat) {
                    ?>
                            <option <?php
                                    if ($inci['id_estat'] == $stat['id_estatus']) {
                                        echo 'selected="selected"';
                                    }
                                    ?> value="<?php echo $stat['id_estatus']; ?>"><?php echo $stat['desc']; ?></option>
                    <?php
                        }
                    }
                    ?>
                </select>
            </div>
            <div class="col col-sm-3 font-weight-bold">
                <span>Accions</span>

            </div>

            <div class="col col-sm-9 text-primary font-weight-bold py-1" id='textarea' style="font-size:18px;">
                <textarea id="action" name="action"></textarea>
                <script>
                    tinymce.init({
                        selector: '#action'
                    });
                </script>
            </div>
            <div class="col col-sm-3 font-weight-bold">
                <span>Adjunta imatges</span>
            </div>
            <div class="col col-sm-9 text-primary font-weight-bold py-1" style="font-size:18px;">
                <input type="file" name="doc1" id="doc1" size="20" />
            </div>
            <div class="col col-sm-3 font-weight-bold">

            </div>
            <div class="col col-sm-9 text-primary font-weight-bold py-1" style="font-size:18px;">
                <input type="file" name="doc2" id="doc2" size="20" />
            </div>
            <div class="col col-sm-3 font-weight-bold">

            </div>
            <div class="col col-sm-9 text-primary font-weight-bold py-1" style="font-size:18px;">
                <input type="file" name="doc3" id="doc3" size="20" />
            </div>


            <div class="col col-sm-3 font-weight-bold">
                <span>Esquema</span>
            </div>
            <div id="divGeneral" class="col col-sm-9 text-primary font-weight-bold py-1"></div>

            <script>
                var x = new PhotoDAW("divGeneral", true);

                function saveCanvas() {
                    document.getElementById("canvas").value=document.getElementById("canvas1").toDataURL();
                }
            </script>
            <textarea name="canvas"  hidden='true' id="canvas" cols="30" rows="10"></textarea>

            <div class="col col-sm-3 font-weight-bold">
            </div>

            <input class="btn btn btn-primary mt-3" onclick="saveCanvas()" type="submit" name="submit" value="Enviar" />


        </div>
        </form>
    </div>
    <script>
    </script>
</div>
</div>