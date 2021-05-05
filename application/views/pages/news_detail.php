<div class="p-3 ">
    <div class="col col-sm-6 text-capitalize font-weight-bold text-dark " style="font-size: 20px;"><?php echo $new->title; ?></div>
    <div class="col col-sm-6  text-end" style="font-size: 16px;"><?php echo $new->date; ?></div>
    <div class="card ml-2 container-flex row " style="min-height:250px">
        <div class="card col col-sm-8 col-md-3 mb-10 m-auto">
        <img src="<?php echo base_url('assets/uploads/files/' . $new->image); ?>" class="ml-6" alt="Sample image" />
        </div>
        <div class="col col-sm-12 text-justify pt-2" style="font-size: 16px;"><?php echo $new->content; ?>
        </div>
    </div>
</div>