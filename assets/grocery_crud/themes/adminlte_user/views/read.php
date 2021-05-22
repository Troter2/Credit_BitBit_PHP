<?php
// $this->set_css($this->default_theme_path.'/bootstrap/css/bootstrap/bootstrap.min.css');
$this->set_css($this->default_theme_path . '/bootstrap/css/font-awesome/css/font-awesome.min.css');
$this->set_css($this->default_theme_path . '/bootstrap/css/common.css');
$this->set_css($this->default_theme_path . '/bootstrap/css/general.css');
$this->set_css($this->default_theme_path . '/bootstrap/css/add-edit-form.css');

if ($this->config->environment == 'production') {
    $this->set_js_lib($this->default_javascript_path . '/' . grocery_CRUD::JQUERY);
    $this->set_js_lib($this->default_theme_path . '/bootstrap/build/js/global-libs.min.js');
} else {
    $this->set_js_lib($this->default_javascript_path . '/' . grocery_CRUD::JQUERY);
    $this->set_js_lib($this->default_theme_path . '/bootstrap/js/jquery-plugins/jquery.form.js');
    $this->set_js_lib($this->default_theme_path . '/bootstrap/js/common/cache-library.js');
    $this->set_js_lib($this->default_theme_path . '/bootstrap/js/common/common.js');
}


?>

<div class="crud-form" data-unique-hash="<?php echo $unique_hash; ?>">
    <div class="container gc-container">
        <div class="row">
            <div class="col-md-12">
                <div class="table-label">
                    <div class="floatL l5">
                        <?php echo $this->l('list_view'); ?> <?php echo $subject ?>
                    </div>
                    <div class="floatR r5 minimize-maximize-container minimize-maximize">
                        <i class="fa fa-caret-up"></i>
                    </div>
                    <div class="floatR r5 gc-full-width">
                        <i class="fa fa-expand"></i>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="form-container table-container">
                    <?php echo form_open($update_url, 'method="post" id="crudForm"  enctype="multipart/form-data" class="form-horizontal"'); ?>

                    <?php
                    $noRead = [
                        'id_user_propietari', 'uuid', 'activation_selector', 'activation_code',
                        'forgotten_password_selector', 'forgotten_password_code',
                        'forgotten_password_time', 'remember_selector', 'remember_code',
                        'created_on', 'last_login', 'active'
                    ];
                    foreach ($fields as $field) {

                        if (in_array($field->field_name, $noRead)) {
                        } else {
                    ?>
                            <div class="form-group row">
                                <label class="col-sm-3 control-label">
                                    <?php echo $input_fields[$field->field_name]->display_as ?>:
                                </label>
                                <div class="col-sm-9 read-row">
                                    <?php echo $input_fields[$field->field_name]->input; ?>
                                </div>
                            </div>
                    <?php }
                    } ?>

                    <?php if (!empty($hidden_fields)) { ?>
                        <!-- Start of hidden inputs -->
                        <?php
                        foreach ($hidden_fields as $hidden_field) {
                            echo $hidden_field->input;
                        }
                        ?>
                        <!-- End of hidden inputs -->
                    <?php } ?>
                    <?php if ($is_ajax) { ?><input type="hidden" name="is_ajax" value="true" /><?php } ?>
                    <div id='report-error' class='report-div error'></div>
                    <div id='report-success' class='report-div success'></div>

                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-7">
                            <?php if (!$this->unset_back_to_list) { ?>
                                <button class="btn btn-default cancel-button" type="button" onclick="window.location = '<?php echo $list_url; ?>'">
                                    <i class="fa fa-arrow-left"></i>
                                    <?php echo $this->l('form_back_to_list'); ?>
                                </button>
                            <?php }

                            ?>
                            <?php
                            // print_r($input_fields['uuid']);
                            // echo "<br>";
                            // echo "u: " . $input_fields['uuid']->input . "-";
                            // echo "<br>";
                            
                            // if ('1234' != $input_fields['uuid']->input)
                            // echo 'Diferent<br>';
                            
                            // echo 'base: '. base_url('incidencia/pdf/' . '1234');
                            // echo "<br>";
                            
                            // $id= $input_fields['uuid']->input;

                            //echo 'base3: '. base_url('incidencia/pdf/' . $uuid);
//                             echo "<br>";
                            
//                             echo 'base2: '. base_url('incidencia/pdf/' . $input_fields['uuid']->input);
//                             echo "<br>";

//                             $str = $input_fields['uuid']->input;
//                             for ($i = 0; $i < strlen($str); $i++) {
//                                 $str[$i] . '   ';
//                             }
//                             echo "<br>";
// //<?php echo base_url('incidencia/pdf/').$input_fields['uuid']->input; 

//$_SESSION["uuid_url"]


                            
                            ?>


                            <a class="btn btn-default cancel-button" type="button" href='<?php echo base_url('incidencia/pdf/'.$_SESSION["uuid_url"])?>'>
                                    <i class=" fa fa-download"></i>
                                Descargar PDF 
                            </a>
                        </div>
                    </div>
                    <?php echo form_close(); ?>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var validation_url = '<?php echo $validation_url ?>';
    var list_url = '<?php echo $list_url ?>';

    var message_alert_edit_form = "<?php echo $this->l('alert_edit_form') ?>";
    var message_update_error = "<?php echo $this->l('update_error') ?>";
</script>