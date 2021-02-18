<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\AntiMacros;
use App\InfoPers72;
use Symfony\Component\Process\Process;
use Symfony\Component\Process\Exception\ProcessFailedException;

use Auth;
use Redirect;
use DateTime;
use Artisan;


class AntiMacrosController extends Controller
{
  public function antimacros(Request $request) {
  if ( $request->input('id') ){
  if ( strlen($request->input('id')) != 40 ){
      return redirect('/');
  }
  else {
    		$seed;
    		$avatar_id;
    		$account_id;
    		$password;
    		$checksum;

    		$seed = hexdec(substr($request->input('id'),0,8));
    		$avatar_id = hexdec(substr($request->input('id'),8,8));
    		$account_id = hexdec(substr($request->input('id'),16,8));
    		$password = hexdec(substr($request->input('id'),24,8));
    		$checksum = hexdec(substr($request->input('id'),32,8));
    		$avatar_id ^= 0xD8FB51A9;
    		$account_id ^= 0x9DC720AC;
    		$password ^= 0x31F42CB7;
    		$checksum ^= 0x7F9B3D2E;

    		$checksum ^= $password;
    		$password ^= $account_id;
    		$account_id ^= $avatar_id;
    		$avatar_id ^= $seed;

    		if ($checksum != $avatar_id + $account_id + $password)
    		{
      return redirect('/');
    		}

        $this->passWord = $avatar_id;
        $this->avatarId = $account_id;
        $this->accountId = $password;

        $checkpers = InfoPers72::select('otp_value')->where('sid', $this->avatarId)->where('account_id', $this->accountId)->get();
        $checkpers = $checkpers[0]->otp_value;

   if ( $checkpers == $avatar_id){

          $playrname = InfoPers72::select('name')->where('sid', $this->avatarId)->where('account_id', $this->accountId)->get();
          $playrname = $playrname[0]->name;
          $blockname = 'block_' . $playrname;
          $blockdate = 'block_date_' . $playrname;
          return view("antimacros", ['blockinfo' => AntiMacros::where('name', $blockname)->get(),'blockinfodate' => AntiMacros::where('name', $blockdate)->get(), 'blockpers' => InfoPers72::where('sid', $this->avatarId)->where('account_id', $this->accountId)->get() ]);

    }

  else{
 return redirect('/');
 }


  //  return view("antimacros", ['antimacros' => AntiMacros::where('category_name', $request->input('tag'))->paginate(9),'category' => Category::all()]);
  }
  }
  else{
  return redirect('/');
  }
  }


  public function blockdrop(Request $request) {

  $cfgPort    = '65528';
  $cfgTimeOut = '5';
  $cfgServer = '10.0.0.3';

  $f=fsockopen($cfgServer,$cfgPort,$cfgTimeOut);

  if (!$f)
  {
  echo "<pre>";
  echo "not connected\\r\
  ";

  }
  else
  {
    $persconvert = iconv ('utf-8', 'windows-1251', $request->input('pers_name'));

    $blockname = 'block_' . $persconvert;
    $blockcounter = 'countMonster_' . $persconvert;

  $command = "#set_global_variable('".$blockname."',0)";
  $commandtwo = "#set_global_variable('".$blockcounter."',0)";
  $commanddebaf = "#add_state(6012,7,1,'".$persconvert."')";
  $commandbaf = "#add_state(201085,7,1500,'".$persconvert."')";
  $commanddebafpet = "#add_cstate(6012,7,1,'".$persconvert."')";
  $commandbafpet = "#add_cstate(201085,7,1500,'".$persconvert."')";


  $paswd = env('CONSOLE_PAWSD');
  fputs ($f, "$paswd\r\n");
  fputs ($f, "$command\r\n");
  fputs ($f, "$commandtwo\r\n");
  fputs ($f, "$commanddebaf\r\n");
  fputs ($f, "$commandbaf\r\n");
  fputs ($f, "$commanddebafpet\r\n");
  fputs ($f, "$commandbafpet\r\n");
  fputs ($f, " "); // this space bar is this for long output

  fclose($f);

  }
echo "Можете закрыть окно и продолжить играть!";

}

}
