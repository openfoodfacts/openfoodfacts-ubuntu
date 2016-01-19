<?xml version="1.0"?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="Loggerhead/1.18.2 Python/2.7.3 Bazaar/2.6.0.lp.2 Paste/1.7.5.1 PasteDeploy/1.3.4 SimpleTAL/4.3 Pygments/1.6 simplejson/3.1.3" name="generator" />
<title>~michael-sheldon/podbird/trunk : contents of app/welcomewizard/Slide5.qml at revision 147</title>
<link href="/static/css/global.css" rel="stylesheet" />
<link href="/static/images/favicon.png" rel="shortcut icon" />

<script type="text/javascript">
var global_path = '/~michael-sheldon/podbird/trunk/';
var collapsed_icon_path = '/static/images/treeCollapsed.png';
var expanded_icon_path = '/static/images/treeExpanded.png';
</script>
<script src="/static/javascript/yui/build/yui/yui-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/oop/oop-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/event/event-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/attribute/attribute-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/base/base-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/dom/dom-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/node/node-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/anim/anim-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/io/io-base-min.js" type="text/javascript"></script>
<script src="/static/javascript/custom.js" type="text/javascript"></script>

<link href="/static/css/view.css" media="all" type="text/css" rel="stylesheet" />
<link href="/static/css/highlight.css" media="all" type="text/css" rel="stylesheet" />

</head>
<body class="public">



<div class="black-link">
<a href="https://code.launchpad.net/~michael-sheldon/podbird/trunk">
← Back to branch summary
</a>
</div>


<h1 class="branch-name">
~michael-sheldon/podbird/trunk
</h1>

<ul id="menuTabs">


<li><a href="/~michael-sheldon/podbird/trunk/changes" title="Changes">Changes</a></li>
<li><a href="/~michael-sheldon/podbird/trunk/files" title="Files" id="on">Files</a></li>

</ul>

<div id="loggerheadCont">
<div id="search_terms"></div>

<div id="breadcrumbs">

<a href="https://code.launchpad.net/~michael-sheldon/podbird/trunk">~michael-sheldon/podbird/trunk</a>


<span>: <span class="breadcrumb">
/<a href="/~michael-sheldon/podbird/trunk/files/147/app">app</a>/<a href="/~michael-sheldon/podbird/trunk/files/147/app/welcomewizard">welcomewizard</a>/Slide5.qml
</span> (revision 147)</span>
</div>

<div>

<ul id="submenuTabs">
<li id="first">
<a href="/~michael-sheldon/podbird/trunk/files/147">browse files</a>
</li>
<li>
<a href="/~michael-sheldon/podbird/trunk/annotate/head:/app/welcomewizard/Slide5.qml">view with revision information</a>
</li>

<li>
<a href="/~michael-sheldon/podbird/trunk/revision/147">view revision</a>
</li>
<li>
<a href="/~michael-sheldon/podbird/trunk/changes?filter_file_id=slide5.qml-20150329224110-n1jx9834etj35c1l-14">view changes to this file</a>
</li>
<li id="last">
<a href="/~michael-sheldon/podbird/trunk/download/head:/slide5.qml-20150329224110-n1jx9834etj35c1l-14/Slide5.qml">download file</a>
</li>
</ul>
<div class="view">
<table id="logentries">

<tr>
<td class="viewLine">
<pre><a id="L1" href="#L1">1</a>
<a id="L2" href="#L2">2</a>
<a id="L3" href="#L3">3</a>
<a id="L4" href="#L4">4</a>
<a id="L5" href="#L5">5</a>
<a id="L6" href="#L6">6</a>
<a id="L7" href="#L7">7</a>
<a id="L8" href="#L8">8</a>
<a id="L9" href="#L9">9</a>
<a id="L10" href="#L10">10</a>
<a id="L11" href="#L11">11</a>
<a id="L12" href="#L12">12</a>
<a id="L13" href="#L13">13</a>
<a id="L14" href="#L14">14</a>
<a id="L15" href="#L15">15</a>
<a id="L16" href="#L16">16</a>
<a id="L17" href="#L17">17</a>
<a id="L18" href="#L18">18</a>
<a id="L19" href="#L19">19</a>
<a id="L20" href="#L20">20</a>
<a id="L21" href="#L21">21</a>
<a id="L22" href="#L22">22</a>
<a id="L23" href="#L23">23</a>
<a id="L24" href="#L24">24</a>
<a id="L25" href="#L25">25</a>
<a id="L26" href="#L26">26</a>
<a id="L27" href="#L27">27</a>
<a id="L28" href="#L28">28</a>
<a id="L29" href="#L29">29</a>
<a id="L30" href="#L30">30</a>
<a id="L31" href="#L31">31</a>
<a id="L32" href="#L32">32</a>
<a id="L33" href="#L33">33</a>
<a id="L34" href="#L34">34</a>
<a id="L35" href="#L35">35</a>
<a id="L36" href="#L36">36</a>
<a id="L37" href="#L37">37</a>
<a id="L38" href="#L38">38</a>
<a id="L39" href="#L39">39</a>
<a id="L40" href="#L40">40</a>
<a id="L41" href="#L41">41</a>
<a id="L42" href="#L42">42</a>
<a id="L43" href="#L43">43</a>
<a id="L44" href="#L44">44</a>
<a id="L45" href="#L45">45</a>
<a id="L46" href="#L46">46</a>
<a id="L47" href="#L47">47</a>
<a id="L48" href="#L48">48</a>
<a id="L49" href="#L49">49</a>
<a id="L50" href="#L50">50</a>
<a id="L51" href="#L51">51</a>
<a id="L52" href="#L52">52</a>
<a id="L53" href="#L53">53</a>
<a id="L54" href="#L54">54</a>
<a id="L55" href="#L55">55</a>
<a id="L56" href="#L56">56</a>
<a id="L57" href="#L57">57</a>
<a id="L58" href="#L58">58</a>
<a id="L59" href="#L59">59</a>
<a id="L60" href="#L60">60</a>
<a id="L61" href="#L61">61</a>
<a id="L62" href="#L62">62</a>
<a id="L63" href="#L63">63</a>
<a id="L64" href="#L64">64</a>
<a id="L65" href="#L65">65</a>
<a id="L66" href="#L66">66</a>
<a id="L67" href="#L67">67</a>
<a id="L68" href="#L68">68</a>
<a id="L69" href="#L69">69</a>
</pre>
</td>
<td class="viewCont">
<pre><span class="pyg-cm">/*</span>
<span class="pyg-cm"> * Copyright 2015 Podbird Team</span>
<span class="pyg-cm"> *</span>
<span class="pyg-cm"> * This file is part of Podbird.</span>
<span class="pyg-cm"> *</span>
<span class="pyg-cm"> * Podbird is free software; you can redistribute it and/or modify</span>
<span class="pyg-cm"> * it under the terms of the GNU General Public License as published by</span>
<span class="pyg-cm"> * the Free Software Foundation; version 3.</span>
<span class="pyg-cm"> *</span>
<span class="pyg-cm"> * Podbird is distributed in the hope that it will be useful,</span>
<span class="pyg-cm"> * but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="pyg-cm"> * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="pyg-cm"> * GNU General Public License for more details.</span>
<span class="pyg-cm"> *</span>
<span class="pyg-cm"> * You should have received a copy of the GNU General Public License</span>
<span class="pyg-cm"> * along with this program.  If not, see &lt;http://www.gnu.org/licenses/&gt;.</span>
<span class="pyg-cm"> */</span>

<span class="pyg-kr">import</span> <span class="pyg-nx">QtQuick</span> <span class="pyg-mf">2.4</span>
<span class="pyg-kr">import</span> <span class="pyg-nx">Ubuntu</span><span class="pyg-p">.</span><span class="pyg-nx">Components</span> <span class="pyg-mf">1.2</span>

<span class="pyg-c1">// Slide 5</span>
<span class="pyg-nx">Component</span> <span class="pyg-p">{</span>
    <span class="pyg-kd">id: slide5</span>
    <span class="pyg-nx">Item</span> <span class="pyg-p">{</span>
        <span class="pyg-kd">id: slide1Container</span>

        <span class="pyg-nx">Image</span> <span class="pyg-p">{</span>
            <span class="pyg-nx">anchors</span> <span class="pyg-p">{</span>
                <span class="pyg-k">top:</span> <span class="pyg-nx">parent</span><span class="pyg-p">.</span><span class="pyg-nx">top</span>
                <span class="pyg-k">bottom:</span> <span class="pyg-nx">introductionText</span><span class="pyg-p">.</span><span class="pyg-nx">top</span>
                <span class="pyg-k">bottomMargin:</span> <span class="pyg-nx">units</span><span class="pyg-p">.</span><span class="pyg-nx">gu</span><span class="pyg-p">(</span><span class="pyg-mi">6</span><span class="pyg-p">)</span>
                <span class="pyg-k">horizontalCenter:</span> <span class="pyg-nx">parent</span><span class="pyg-p">.</span><span class="pyg-nx">horizontalCenter</span>
            <span class="pyg-p">}</span>
            <span class="pyg-k">fillMode:</span> <span class="pyg-nx">Image</span><span class="pyg-p">.</span><span class="pyg-nx">PreserveAspectFit</span>
            <span class="pyg-k">source:</span> <span class="pyg-nx">Qt</span><span class="pyg-p">.</span><span class="pyg-nx">resolvedUrl</span><span class="pyg-p">(</span><span class="pyg-s2">&quot;../graphics/support.png&quot;</span><span class="pyg-p">)</span>
        <span class="pyg-p">}</span>

        <span class="pyg-nx">Label</span> <span class="pyg-p">{</span>
            <span class="pyg-kd">id: introductionText</span>
            <span class="pyg-k">anchors.centerIn:</span> <span class="pyg-nx">parent</span>
            <span class="pyg-k">elide:</span> <span class="pyg-nx">Text</span><span class="pyg-p">.</span><span class="pyg-nx">ElideRight</span>
            <span class="pyg-k">fontSize:</span> <span class="pyg-s2">&quot;x-large&quot;</span>
            <span class="pyg-k">maximumLineCount:</span> <span class="pyg-mi">2</span>
            <span class="pyg-k">text:</span> <span class="pyg-nx">i18n</span><span class="pyg-p">.</span><span class="pyg-nx">tr</span><span class="pyg-p">(</span><span class="pyg-s2">&quot;Support&quot;</span><span class="pyg-p">)</span>
            <span class="pyg-k">horizontalAlignment:</span> <span class="pyg-nx">Text</span><span class="pyg-p">.</span><span class="pyg-nx">AlignHCenter</span>
            <span class="pyg-k">width:</span> <span class="pyg-nx">parent</span><span class="pyg-p">.</span><span class="pyg-nx">width</span>
            <span class="pyg-k">wrapMode:</span> <span class="pyg-nx">Text</span><span class="pyg-p">.</span><span class="pyg-nx">WordWrap</span>
        <span class="pyg-p">}</span>

        <span class="pyg-nx">Label</span> <span class="pyg-p">{</span>
            <span class="pyg-kd">id: finalMessage</span>
            <span class="pyg-nx">anchors</span> <span class="pyg-p">{</span>
                <span class="pyg-k">top:</span> <span class="pyg-nx">introductionText</span><span class="pyg-p">.</span><span class="pyg-nx">bottom</span>
                <span class="pyg-k">bottom:</span> <span class="pyg-nx">parent</span><span class="pyg-p">.</span><span class="pyg-nx">bottom</span>
                <span class="pyg-k">left:</span> <span class="pyg-nx">parent</span><span class="pyg-p">.</span><span class="pyg-nx">left</span>
                <span class="pyg-k">right:</span> <span class="pyg-nx">parent</span><span class="pyg-p">.</span><span class="pyg-nx">right</span>
                <span class="pyg-k">margins:</span> <span class="pyg-nx">units</span><span class="pyg-p">.</span><span class="pyg-nx">gu</span><span class="pyg-p">(</span><span class="pyg-mi">1</span><span class="pyg-p">)</span>
                <span class="pyg-k">topMargin:</span> <span class="pyg-nx">units</span><span class="pyg-p">.</span><span class="pyg-nx">gu</span><span class="pyg-p">(</span><span class="pyg-mi">4</span><span class="pyg-p">)</span>
            <span class="pyg-p">}</span>
            <span class="pyg-k">wrapMode:</span> <span class="pyg-nx">Text</span><span class="pyg-p">.</span><span class="pyg-nx">WordWrap</span>
            <span class="pyg-k">horizontalAlignment:</span> <span class="pyg-nx">Text</span><span class="pyg-p">.</span><span class="pyg-nx">AlignHCenter</span>
            <span class="pyg-k">linkColor:</span> <span class="pyg-nx">podbird</span><span class="pyg-p">.</span><span class="pyg-nx">appTheme</span><span class="pyg-p">.</span><span class="pyg-nx">linkText</span>
            <span class="pyg-c1">// TRANSLATORS: The %1 points to a url defined in html format &lt;a href=\link\&gt;Link&lt;/a&gt;.</span>
            <span class="pyg-k">text:</span> <span class="pyg-nx">i18n</span><span class="pyg-p">.</span><span class="pyg-nx">tr</span><span class="pyg-p">(</span><span class="pyg-s2">&quot;If you find any bugs or have any feature requests, let us know on our project page at %1&quot;</span><span class="pyg-p">).</span><span class="pyg-nx">arg</span><span class="pyg-p">(</span><span class="pyg-s2">&quot;&lt;a href=\&quot;https://launchpad.net/podbird\&quot;&gt;launchpad.net&lt;/a&gt;&quot;</span><span class="pyg-p">)</span>
            <span class="pyg-k">onLinkActivated:</span> <span class="pyg-nx">Qt</span><span class="pyg-p">.</span><span class="pyg-nx">openUrlExternally</span><span class="pyg-p">(</span><span class="pyg-nx">link</span><span class="pyg-p">)</span>
        <span class="pyg-p">}</span>
    <span class="pyg-p">}</span>
<span class="pyg-p">}</span>
</pre>
</td>
</tr>
</table>
</div>
</div>
<p id="footer" class="fl">
Loggerhead is a web-based interface for <a href="http://bazaar-vcs.org/">Bazaar</a> branches
<br />
Version: 1.18.2<span>, Revision: 17886</span>
</p>
</div>
</body>
</html>