<?php

    require_once ('lib/config.php');

    $cred = new CRUD();
    $v_obj = new CHD();

    $username = $v_obj->valid($_POST['username']);
    $password = $v_obj->valid($_POST['password']);

    if(!empty($username) && !empty($password) ){

        $row = $cred->select_one('user'," `username` = '$username' AND `password` = '$password'  ");
        if($row->num_rows > 0 ){

            $row = $row->fetch_array();

            $_SESSION['user_id']    = $row['id'];
            $_SESSION['username']   = $row['username'];
            $_SESSION['type']       = $row['type'];
            $_SESSION['name']       = $row['name'];
            $_SESSION['photo']      = $row['photo'];


            $_SESSION['select']     = $row['select'];
            $_SESSION['insert']     = $row['insert'];
            $_SESSION['delete']     = $row['delete'];
            $_SESSION['updata']     = $row['updata'];
            $_SESSION['key']        = "Home_work";

            header("location: www/");
            exit();

        }else {
            header("location: login.php?noteuser");
            exit();
        }

    }else {
        header("location: login.php?empty");
        exit();
    }
















?>