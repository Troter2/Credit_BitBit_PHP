<div class="card p-4 col col-sm-8 col-md-9 m-auto">
    <div class="row">
        <img class="mx-auto" src="https://www.insureon.com/-/media/blog/posts/2018/photo_computer-repair.jpg?h=370&iar=0&w=750&rev=8444837b5596473f82b6668742ff11a6" style="height: 400px;" alt="">
    </div>
</div>
<br />
<div class="card p-4 col col-sm-12 col-md-10 m-auto">
    <div class="row">
        <p>Una empresa dedicada a la reparació d’equips informàtics per a centres educatius,
            demana disposar d’una plataforma per gestionar totes les seves reparacions. Som una empresa amb anys d'experiència que compta amb grans professionals
            en el sector de la informática, especialitzats en hardware i reparació d'equips. Ho podeu comprobar amb els projoectes que es mostren en la pagina principal.
        </p>
    </div>
</div>

<div class="container">
    <div class="main-timeline">
        <?php
        if (isset($events)) {
            foreach ($events as $event) {
        ?>
                <div class="timeline">
                    <div class="icon"></div>
                    <div class="date-content">
                        <div class="date-outer">
                            <span class="date">
                                <span class="year"><?php echo $event['date']; ?></span>
                            </span>
                        </div>
                    </div>
                    <div class="timeline-content">
                        <h5 class="title"><?php echo $event['titol']; ?></h5>
                        <p class="description">
                            <?php echo $event['content']; ?>
                        </p>
                    </div>
                </div>

        <?php
            }
        }
        ?>
    </div>
</div>