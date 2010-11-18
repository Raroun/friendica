<?php


require_once('library/openid.php');


function openid_content(&$a) {

	if((x($_GET,'openid_mode')) && (x($_SESSION,'openid'))) {
		$openid = new LightOpenID;

		if($openid->validate()) {

			$r = q("SELECT * FROM `user` WHERE `openid` = '%s' AND `blocked` = 0 AND `verified` = 1 LIMIT 1",
				dbesc($_SESSION['openid'])
			);
			if(! count($r)) {
				notice( t('Login failed.') . EOL );
				goaway($a->get_baseurl());
  			}
			unset($_SESSION['openid']);

			$_SESSION['uid'] = $r[0]['uid'];
			$_SESSION['theme'] = $r[0]['theme'];
			$_SESSION['authenticated'] = 1;
			$_SESSION['page_flags'] = $r[0]['page-flags'];
			$_SESSION['my_url'] = $a->get_baseurl() . '/profile/' . $r[0]['nickname'];

			notice( t("Welcome back ") . $r[0]['username'] . EOL);
			$a->user = $r[0];
			if(strlen($a->user['timezone']))
				date_default_timezone_set($a->user['timezone']);

			$r = q("SELECT * FROM `contact` WHERE `uid` = %s AND `self` = 1 LIMIT 1",
				intval($_SESSION['uid']));
			if(count($r)) {
				$a->contact = $r[0];
				$a->cid = $r[0]['id'];
				$_SESSION['cid'] = $a->cid;
			}

			header('X-Account-Management-Status: active; name="' . $a->user['username'] . '"; id="' . $a->user['nickname'] .'"');
			if(($a->module !== 'home') && isset($_SESSION['return_url']))
				goaway($a->get_baseurl() . '/' . $_SESSION['return_url']);
			else
				goaway($a->get_baseurl());
		}
	}
	notice( t('Login failed.') . EOL);
	goaway($a->get_baseurl());
	// NOTREACHED
}