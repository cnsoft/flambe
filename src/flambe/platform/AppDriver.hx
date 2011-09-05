//
// Flambe - Rapid game development
// https://github.com/aduros/flambe/blob/master/LICENSE.txt

package flambe.platform;

import flambe.asset.AssetPackLoader;
import flambe.Entity;
import flambe.display.Texture;

interface AppDriver
{
    function init (root :Entity) :Void;

    function loadAssetPack (url :String) :AssetPackLoader;

    function getStageWidth () :Int;
    function getStageHeight () :Int;

    function getStorage () :Storage;

    function getLocale () :String;

    function callNative (funcName :String, params :Array<Dynamic>) :Dynamic;
}
