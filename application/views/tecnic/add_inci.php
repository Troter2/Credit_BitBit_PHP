<div class="shadow rounded p-4 col col-sm-12 col-md-10 mx-auto mt-3">
    <div class="row col col-sm-12">
        <?php echo form_open('updateInci'); ?>

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

            <div class="col col-sm-9 text-primary font-weight-bold py-1" style="font-size:18px;">
                <textarea id="mytextarea" name="mytextarea"></textarea>
                <script>
                    tinymce.init({
                        selector: '#mytextarea'
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
            
            </div>
            <div class="col col-sm-9 text-primary font-weight-bold py-1" style="font-size:18px;">
                <input type="file" name="doc3" id="doc3" size="20" />
            </div>


            <input class="btn btn btn-primary mt-3" type="submit" name="submit" value="Enviar" />


        </div>
        </form>
    </div>
</div>
</div>