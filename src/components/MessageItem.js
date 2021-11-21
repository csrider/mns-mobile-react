/* A message item is the actual launchable message.
 * It has the name of the message, as well as possibly an icon, color, and other options.
 */


function MessageItem(props) {

    function launchMessage() {
        //console.log("launchMessage for "+props.name)
        
    }

    return (
        <div onClick={launchMessage} className="message-item-container">
            <img src={props} alt="" />
            <span>{props.name}</span>
        </div>
    )
}

export default MessageItem;