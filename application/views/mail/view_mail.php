<div class="p-3 ">
    <div class="col col-sm-6 text-capitalize font-weight-bold text-dark " style="font-size: 20px;"><?php echo $message->about; ?></div>
    <div class="card ml-2 container-flex row " style="min-height:250px">
        <div class="row border-bottom container-flex ml-0">
            <div class="col col-sm-6  " style="font-size: 16px;"> De: <?php echo $message->from; ?></div>
            <div class="col col-sm-6  text-end" style="font-size: 16px;"><?php echo $message->send_date.' '. $message->send_hour; ?></div>
        </div>
        <div class="col col-sm-12 text-justify pt-2" style="font-size: 16px;"><?php echo $message->content; ?>
        </div>
    </div>
</div>