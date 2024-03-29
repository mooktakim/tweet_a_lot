==================================================================
Embedly - JQuery - An OEmbed Library to Replace Links with Content
==================================================================

Embedly - JQuery is a JQuery Library for Embedly that will replace links with
content. It follows the oEmbed spec (http://oembed.com) for content retrieval,
while utilizing http://api.embed.ly as a single endpoint. 
`Note`: We recommended signing up and adding the `key <http://embed.ly/pricing>`_ parameter to your calls for higher usage.

Documentation
=============

The most up-to-date documentation can be found on the `README
<http://github.com/embedly/embedly-jquery/blob/master/README.rst>`_. If you've discovered the recursive nature of that statement, good on you. 
You can continue to read the most up-to-date documentation below.

Updates in Rev 2.1.5
====================
* added secure flag for https requests

Requirements
============

Requires JQuery 1.3.1 or greater::

  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>


Using Embedly-JQuery
====================

There are two ways to interact with this library. You can call Embedly directly
or use CSS Selectors to replace links

Call Directly
-------------
Will Return a JSON object representing an oembed or null, and a dictionary object representing the original url and DOM node.
::
  
    #Alert the tile of a video
    $.embedly('http://www.youtube.com/watch?v=LfamTmY5REw', {}, function(oembed, dict){ 
       alert(oembed.title);
    });
  
    # Call with maxWidth option set to 600px and maxHeight option set to 400px
    $.embedly('http://www.youtube.com/watch?v=LfamTmY5REw', 
             { maxWidth: 600, 
              maxHeight: 400, 
                success: function(oembed, dict){ 
                           alert(oembed.title);
                         });

    # Call with key set to <your embedly key>, maxWidth option set to 600px and maxHeight option set to 400px
    $.embedly('http://www.youtube.com/watch?v=LfamTmY5REw', 
             { maxWidth: 600, 
              maxHeight: 400,
              key: 'insert your embedly key', 
                success: function(oembed, dict){ 
                           alert(oembed.title);
                         });

    # Pass in an array of urls to load simultaneously
    $.embedly(['http://www.youtube.com/watch?v=LfamTmY5REw', 
               'http://www.youtube.com/watch?v=lOC_JjNFkVw', 
               'http://www.youtube.com/watch?v=cTl3U6aSd2w'], 
              {maxWidth: 600,
                success: function(oembed, dict){
                           alert(oembed.title);
                         });
     # Include a jQuery set of DOM elements so it behaves more like the CSS Selector form below
     # this form returns the jQuery set, so you can chain jQuery functions after it
     $.embedly('http://www.youtube.com/watch?v=LfamTmY5REw', 
               {maxWidth: 600,
                   elems: $('#element'),
                 success: function(oembed, dict){
                            alert(oembed.title);
                          });
    
CSS Selector
------------
Use a CSS selector to replace every valid link with an embed on the page.
::
    
    # Replace all valid links
    $('a').embedly();
  
    # Replace a subset of links
    $('a.oembed').embedly();
  
    # Replace with maxWidth option set to 600px and method option set to 'after'
    $('a').embedly({maxWidth:600,'method':'after'});
  
    # Replace only Hulu links
    $('a').embedly({maxWidth:600,'urlRe': /http:\/\/(www\.hulu\.com\/watch.*)/i,'method':'after'});

    # Embedly now supports chaining, so you can modify your original jQuery set after triggering Embedly
    $('a).embedly({maxWidth:450}).css('backgroundColor','#dadada');
  
Valid Options
-------------
endpoint [`String:oembed`]
  A string value mapping to one of three Embedly endpoints. A `paid plan <http://embed.ly/pricing>`_  is required for preview and ojectify.
  
  * `oembed <http://embed.ly/docs/endpoints/1/oembed>`_ - a standard in 3rd party embedding, contains a finite set of attributes.
  * `preview <http://embed.ly/docs/endpoints/1/preview>`_ - returns a larger set of attributes (multiple images, RSS content, and embeds in page) for customizing your embed.
  * `objectify <http://embed.ly/docs/endpoints/2/objectify>`_ - returns all of the meta and api data Embedly has for a link. Advanced users.
  
key [`string:''`]
  You can `sign up <http://embed.ly/pricing>`_ or `log in <http://app.embed.ly/login>`_ as an existing user to retrieve your Embedly key. 
  A key will allow higher usage levels and extra features, see `breakdown <http://embed.ly/pricing>`_.

maxWidth [`Number:null`]
  A number representing the "max width" in pixels a piece of content can be displayed in your page.
 
maxHeight [`Number:null`]
  A number representing the "max height" in pixels a piece of content can be displayed in your page.
 
secure [`Boolean:false`]
  Set to true if you want your requests to be HTTPS
  
urlRe [`RegEx:`]
  A regular expression representing what links to show content for.  
  Use : http://api.embed.ly/tools/generator to generate regular expressions for a specific set of sources.

method [`String:'replace'`]
  A string value to tell Embedly how to place the content in your page.

  * `replace` - replaces the link with the content
  * `after` - inserts the content after the link
  * `afterParent` - inserts the content after the parent element
  * `replaceParent` - replaces parent element with the embed content

wrapElement [`String:'div'`]
  A string value representing the valid html element to wrap the content in.

className [`String:'embed'`]
  A string value representing a CSS class you would like to assign to the wrapElement.

addImageStyles [`Boolean:true`]
  A boolean value representing whether or not Embedly should use the style element to resize images based on the maxWidth and maxHeight parameters
   
embedly_wmode [`String:'opaque'`]
  A string value either `window`, `opaque` or `transparent` representing the flash WMODE parameter which allows layering of Flash content with DHTML layers.

  * `window` - movie plays in its own rectangular window on a web page.
  * `opaque` - the movie hides everything on the page behind it.
  * `transparent` - the background of the HTML page shows through all transparent portions of the movie, this may slow animation performance.

success [`Function:default function`]
  If you would like to replace our default callback action, which takes ['replace','after','afterParent'] as a parameter and writes the oEmbed.code to your DOM element,
  You may do so with this function. Alternatively you can use the optional function parameter in the embedly({}, function(){}) call, but we're deprecating that in favor
  of this optional parameter.  If you want to access the oEmbed data, but still keep the default callback function, we have introduced a new custom event handler that fires
  when the oEmbed object is returned. Read below for more information on that

error [`Function:default function`]
  Developers can write a function to handle URLs that Embedly does not. For accounts without an Embedly key, this will include URLs from services not in
  our 218 supported providers. The error function has two parameters:
  
  * 'node' - this is a jQuery reference for the original <a> tag with the erroneous URL
  * 'dict' - an object containing error information. More information on what the dict includes can be found in 
             our `Documentation <http://embed.ly/docs/endpoints/1/oembed#error-codes>`_.
             
Endpoints
=========
Embedly had three endpoints to choose from: 'oembed', 'preview', and 'objectify'. Preview and Objectify are only available for developers with valid
Embedly keys. Users can sign up for a key `here <http://embed.ly/pricing>`_. Each of the endpoints offer different perspectives of a URL. You can
read about the major differences in our `Endpoint Documentation <http://embed.ly/docs/endpoints>`_. Developers intending to use Preview or Objectify
will have to include their own callback function for handling the embeds. Our default success callback is designed to work with 'oembed' only.


Custom Event
============
Starting in revision 2.0.0 we have started writing the oEmbed data to the DOM elements using jQuery.data(). You can read more about the data function `here <http://api.jquery.com/jQuery.data/>`_, but basically
saves the oembed data on the element for retrieval later.  For example:
::

  # $('a').embedly()
  # ... after the AJAX returns an oembed ...
  $('a').data('oembed') 

This call returns the oembed object for each a tag, so you can access the data later on. Because this data is not written to the DOM until the AJAX requests are complete we have added a
custom event listener called 'embedly-oembed.' This event fires for each node when the oEmbed object is written to the node using jQuery.data(). We did this so that developers could
continue to use our default callback function for writing embeds to the page and still have access to the oembed data for customization.
::

  # version 1
  $('a').embedly({maxWidth:500}).bind('embedly-oembed', function(e){
    var oembed = $(this).data('oembed');
    alert(oembed.title);
  });

  # version 2
  $('a').embedly({maxWidth:500}).bind('embedly-oembed', function(e, oembed){
    alert(oembed.title);
  });

The event handler gets the oembed object passed in as a parameter as well if you don't want to use jQuery.data(); The two are equivalent.

Examples
-----------------------------------------
Examples can be found at - http://github.com/embedly/embedly-jquery/tree/master/examples/

Licensing
---------
BSD License can be found at - http://github.com/embedly/embedly-jquery/tree/master/LICENSE/

Embedly URLs
------------

   * Git location:       http://github.com/embedly/embedly-jquery/
   * Home Page:          http://embed.ly
   * Support:            http://support.embed.ly

