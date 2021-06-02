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
                <textarea id="action" name="action"><?php echo $tasca['accions']; ?></textarea>
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
            <div class="col col-sm-3 text-primary font-weight-bold py-1" style="font-size:18px;"></div>
            <div class="col col-sm-9 row text-primary" >
                <?php
                if (isset($images)) {

                    foreach ($images as $image) {
                ?>
                        <div class="col col">
                        <img height="128" width="128" src="http://localhost/Credit_BitBit_PHP/images/<?php echo $image['path'] . '/' . $image['image'] ?>" alt="">
                        <br><a href="<?php echo base_url('delete_img/' . $image['image']) ?>">Borrar Imatge</a>
                        </div>


                <?php
                    }
                }
                ?>
            </div>


            <div class="col col-sm-3 font-weight-bold">
                <span>Esquema</span>
            </div>
            <div id="divGeneral" class="col col-sm-9 text-primary font-weight-bold py-1"></div>



            <script>
                var x = new PhotoDAW("divGeneral", true);
<?php
$database64="data:image/png;base64,".$tasca['canvas'];
?>
                x.loadImatge('<?php echo $database64; ?>');
                function saveCanvas() {
                    var strData = document.getElementById("canvas1").toDataURL().replace("data:image/png;base64,", "");

                    document.getElementById("CFILE").value = strData;

                }

            </script>
            
            <input name="CFILE" type="hidden" id="CFILE" value="">

            <div class="col col-sm-3 font-weight-bold">
            </div>

            <input class="btn btn btn-primary mt-3" type="submit" onclick="saveCanvas()" name="submit" value="Enviar" />
        </div>
        </form>
    </div>
    <script>
    </script>
</div>
</div>