<?
class npp {
	var $page;
	var $limit;
	var $startof;
	var $totalrecords;
	var $row;
	var $last;
	var $start;
	var $sql;
	var $lang=array();

function show($op,$nopages,$url="") {
	//Set vars
	$this->lang = $this->lang();
	$this->NumberOfPagesToShow = $nopages;
	$this->start = $this->start();
	$this->last = $this->last();
	// Do The Work!
	if ($this->totalrecords > $this->limit) {
		$search = array(
			"#\{H\}#is",
			"#\{A\}#is",
			"#\{P\}#is",
			"#\{F\}#is",
			"#\{L\}#is",
			"#\{R\}#is",
			"#\{N\}#is",
			"#\{E\}#is",
			"#\{S\}#is",
		);
		$replace = array(
			$this->printheader(),
			$this->NumberOfPages(),
			$this->pages(),
			$this->firstpage(),
			$this->lastpage(),
			$this->prevpage(),
			$this->nextpage(),
			$this->BuildExtra(),
			$this->select(),
		);

		$op=preg_replace($search, $replace, $op);
		$checked = $this->CheckUrl($url);
		$op = str_replace("{url}",$checked['url'],$op);
		$op = str_replace("{chr}",$checked['chr'],$op);
		return $op;
	}// * End : if ($this->totalrecords > $this->limit)
}//## End : function show($op,$url,$chr,$nopages)

function BuildExtra(){
	$pages = ceil($this->totalrecords/$this->limit); 
	for ($i=1;$i<=$pages;$i++) { 
		$newoffset = $this->limit * ($i-1); 
		$to = $newoffset + $this->limit ;
		if ($to > $this->totalrecords ) {
			$to = $this->totalrecords;
		} // End of :if ($to > $this->totalrecords )
		$from = $newoffset;
		if ($from==0) {
			$from=1;
		} // End of :if ($from==0)
		if (!$i == 1) {
			$from=$from+1;
		} // End of : if (!$i == 1) {
		if($this->page != $i ) { 
			$after=($this->page+($this->NumberOfPagesToShow+1));
			$befor=($this->page-($this->NumberOfPagesToShow+1));
			if(($i<$after) && ($i>$befor))  {
				if ((empty($this->page)) && ($i==1)) {
					$result .="<b><font color=\"blue\" size=\"4\"> (".$from."- ".$to.") &nbsp;</b></font>"; 
				} else {
					$url = $this->CheckPageOne($i);
					$result .="<a href=\"".$url."\">(".$from."-".$to." )</a> &nbsp;"; }
				} // End : if ((empty($this->page)) && ($i==1))
			  }  //End of : if(($i<$after) && ($i>$befor))
				else { 
					$result .="<b><font color=\"blue\" size=\"4\"> (".$from."-".$to." ) &nbsp;</b></font>"; 
		 } // End : if($this->page != $i ) 
	} // End : for ($i = 1; $i <= $pages; $i++)
	return $result;
}//## End : function BuildExtra(

function set($page,$limit,$totalrecords) {
	$this->page			= $page;
	$this->limit		= $limit;
	$this->totalrecords = $totalrecords;
	$this->CheckPage();
	$this->sqllimit();
}//## End : function set

function sql() {
	return $this->sql;
}//## End : function sql()

function row() {
	return $this->row;
}//## End : function row()

function CheckPage() {
	if ((empty($this->page)) || ((!is_numeric($this->page)))) {
		$this->page=0;
	} else {
		$this->page=intval($this->page);
		if($this->page > $this->allpages()) {
			$this->page=$this->allpages();
		} else {
			$this->page=$this->page;
		}
	}
	return $this->page;
}//## End of : function CheckPage

function sqllimit() {
	if ($this->page <= 1){
		$sql_limit="0,".$this->limit." ";
		$row=0;
	} else {
		$this->startof = $this->limit*($this->page-1); 
	    $sql_limit = " ".$this->startof." , ".$this->limit." ";
		$row=$this->startof;
  }
  $this->sql = $sql_limit;
  $this->row = $row;
} //## End of : function sqllimit()

function start () {
	return	$this->start = $this->row+1;
}//## End : function start

function last () {
	$this->last =  $this->startof + $this->limit;
	if ($this->last > $this->totalrecords) {
		$this->last = $this->totalrecords ;
	}// End of : if ($last > $totalRecords) {
	return $this->last;
}//##End : function last ()

function NumberOfPages() {
	return $this->lang[PAGES]." (".$this->allpages().") : ";
}

function printheader() {
	return $this->lang[SHOW_RESULTS]." (".$this->start.") ".$this->lang[TO]."  (".$this->last.") ".$this->lang[TOTAL]."   (".$this->totalrecords.")<br>" ;
}//##End : function printheader

function firstpage() {
	$isfirst =ceil($this->totalrecords/$this->limit);
	if (($isfirst>5) && (!empty($this->page))) { 
			return "<a href=\"{url}\"><font color=blue><b>".$this->lang[FIRST_PAGE]."</a>&nbsp;&nbsp;</font></b>";
	}
}//## End : function firstpage ()

function lastpage() {
	$url ="{url}";
	$islast =  ceil($this->totalrecords/$this->limit);
	if ($islast > 5 ) { 
		$this->last=($this->limit*$islast)-$this->limit;
		if ($this->page < $this->allpages()) {
			$url .= "{chr}page=".$islast."";
			$result = "<a href=\"".$url."\">".$this->lang[LAST]."</a>&nbsp;&nbsp;";
		} // End of : if ($this->page < $this->allpages()) 
	} // End of : if ($islast > 5 )
	return $result;
}//## End : function lastpage()

function allpages() {
	return ceil($this->totalrecords/$this->limit); 
}//##End: function allpages()

function prevpage() {
	$url ="{url}";
	if ($this->page != 0) { 
		$prevpage = ($this->startof/$this->limit);
		if(($this->page-1) >=2) {
		$url .="{chr}page=$prevpage";
		}
		$result = "<a href=\"".$url."\">".$this->lang[PREV]." </a> &nbsp;"; 
	}
	return $result;
}//## End:function prevpage(

function nextpage() {
	$url ="{url}";
	if ($this->page < $this->allpages()) { 
		$nextpage = ($this->startof/$this->limit)+2;
		$url .="{chr}page=$nextpage";
		$result ="<a href=\"".$url."\">".$this->lang[NEXT]."</a> &nbsp;"; 
	} // End of :if ($this->page < $this->allpages())
	return $result;
}//## End  :function nextpage

function select(){
	$url ="{url}";
	$result .= "<form method=\"get\">
	<select name=\"page\" onchange='window.location.href=this.options[this.selectedIndex].value'>
	<option selected>".$this->lang[CHOOSE]."
	";
	$pages = ceil($this->totalrecords/$this->limit); 
	for ($i=1;$i<=$pages;$i++) { 
		if(($this->page == $i) || ( ($i==1) && (empty($this->page))) ) {
			$result .= "<option style=\"color: #FF0000\"  value=\"".$url."\">-(".$i." >".$this->allpages().")-</option></style>";
		} else {
			$url =$this->CheckPageOne($i);
			$result .= "<option value=\"".$url."\">".$i." >".$this->allpages()."</option>";
		}
	}
	$result .="</select></form>";
	return $result;
}//## End : function select()

function CheckPageOne($i){
	if ($i!==1) {
		return "{url}{chr}page=$i";
	} else {
		return "{url}";
	}
}//## End : function CheckPageOne

function pages(){
	$pages = floor($this->totalrecords/$this->limit); 
	for ($i=1;$i<=$pages+1;$i++) { 
		if($this->page != $i ) { 
			$after=($this->page+($this->NumberOfPagesToShow));
			$befor=($this->page-($this->NumberOfPagesToShow));
			if($i<$after && $i>$befor)  {
				if((empty($this->page)) && ($i==1)) {
				$pagelist .="<b><font color=\"blue\" size=\"4\">&nbsp;".$i."&nbsp;</b></font>|"; 
				} else {
					$url =$this->CheckPageOne($i);
					$pagelist .="&nbsp;<a href=\"".$url."\" style='text-decoration: none; font-family:\"Microsoft Sans Serif\"; font-size:12px; color:#646464;'>".$i."</a>&nbsp;|"; 
				}// End :if(empty($page) && $i==1) {
			} // End of : if  ($i < $b && $i > $a)
		} // End of : if ($page != $i)
		else
		{ 
			$pagelist .="<b><font color=\"blue\" size=\"4\">&nbsp;".$i."&nbsp;</b></font>|"; 
		} // End of : else
	} // End of : for ($i = 2; $i <= $pages; $i++)
	return $pagelist;
}//## End : function pages()

function lang(){
		return array(
			'SHOW_RESULTS'=> 'Showing results from' ,
			'TO'=> 'to',
			'TOTAL'=>'of total',
			'FIRST_PAGE'=> '<img src="images/resultset_first.png" border=0 alt="First page" />',
			'PREV'=> '<img src="images/resultset_previous.png" border=0 alt="Previous page" />',
			'NEXT'=>'<img src="images/resultset_next.png" border=0 alt="Next page" />',
			'PAGES'=> '<br /><img src="images/page_white_copy.png" /> Pages',
			'LAST'=>'<img src="images/resultset_last.png" border=0 alt="Last page" />',
			'CHOOSE'=>'Choose page',
			);
} //## End : function lang()

function CheckUrl($url){
	if(empty($url)) {
		$url = $_SERVER['PHP_SELF'];
		$chr="?";
	} else {
		if(strpos($url,"?")===false) {
			$url = "?".$url;
		} else {
			$url = $url;
		}
		$chr="&";
	}
	return array("url"=>$url,"chr"=>$chr);
}//## End : function CheckUrl($url)
}//@@ End of class
?>