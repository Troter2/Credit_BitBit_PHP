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
            </script>

            <div class="col col-sm-3 font-weight-bold">
                <span>Material Utilitzat</span>
            </div>

            <div class="col col-sm-9 text-primary font-weight-bold py-1 row" style="font-size:18px;">
                <select class="form-control col col-sm-6 " name="material" id="material">
                    <option value="" selected="selected">Selecciona material</option>
                    <?php foreach ($material as $item) : ?>
                        <option value="<?php echo $item['id_mat']; ?>" data-tokens="<?php echo $item['nom']; ?>"><?php echo $item['nom']; ?></option>
                    <?php endforeach ?>
                </select>
                <div class="col col-sm-1 font-weight-bold">
                </div>
                <input class="form-control col col-sm-3" type="number" value="1" min="0">


            </div>

            <input class="btn btn btn-primary mt-3" type="submit" name="submit" value="Enviar" />


        </div>
        </form>
    </div>
    <script>
    </script>
</div>
</div>