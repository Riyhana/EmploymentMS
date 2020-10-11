<?php

    require_once("../lib/config.php");
    if(isset($_POST['insert'])){


        $curd   = new CRUD();
        $v_obj  = new CHD();

        $last_id = $curd->last_id('employee') + 1 ;
        $photo = $curd->upload_file('photo','users',$last_id);
        $cv    = $curd->upload_file('cv','cv',$last_id);

        $firstname  = $v_obj->valid($_POST['firstname']);
        $lastname   = $v_obj->valid($_POST['lastname']);
        $email      = $v_obj->valid($_POST['email']);
        $DOB        = $v_obj->valid($_POST['DOB']);
        $phone      = $v_obj->valid($_POST['phone']);
        $Address    = $v_obj->valid($_POST['Address']);
        $firstname  = $v_obj->valid($_POST['firstname']);

        $insert = $curd->insert(
            'employee',
            ' `firstname` ,`lastname`,`phone`, `DOB`,  `Address`, `emp_status` , `cv_file_url`, `photo` , `email` ',
            " '$firstname' , '$lastname' , '$phone' , '$DOB' , '$Address' , 'pending', '$cv' , '$photo' , '$email' "
        );


        $last_id  =  $GLOBALS['DB']->insert_id;
        $comment  = $v_obj->valid($_POST['comment']);

        $insert = $curd->insert('commentinfo',' `emp_comment` , `emp_id` , `status` ' , " '$comment' , '$last_id' , 'null' ");

        if($insert){
            header("location: user.php?saved");
            exit();
        }else {
            header("location: user.php?error");
            exit();
        }

    }











?>