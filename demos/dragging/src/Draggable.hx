import flambe.Component;
import flambe.display.MouseEvent;
import flambe.display.Sprite;
import flambe.display.Transform;
import flambe.Entity;
import flambe.Input;
import flambe.math.Point;

class Draggable extends Component
{
    public function new ()
    {
    }

    private function onMouseDown (event :MouseEvent)
    {
        _dragging = true;
        _offset = owner.get(Sprite).getViewMatrix().inverseTransformPoint(
            event.viewX, event.viewY);
    }

    override public function update (dt :Int)
    {
        if (Input.isMouseDown && _dragging) {
            var xform = owner.get(Transform);
            xform.x.set(Input.mouseX - _offset.x);
            xform.y.set(Input.mouseY - _offset.y);
        } else {
            _dragging = false;
        }
    }

    override public function onAttach (entity :Entity)
    {
        super.onAttach(entity);
        owner.get(Sprite).mouseDown.add(onMouseDown);
    }

    override public function onDetach ()
    {
        owner.get(Sprite).mouseDown.remove(onMouseDown); // FIXME
        super.onDetach();
    }

    private var _dragging :Bool;
    private var _offset :Point;
}