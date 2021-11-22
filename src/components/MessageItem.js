/* A message item is the actual launchable message.
 * It has the name of the message, as well as possibly an icon, color, and other options.
 */

import IconFoundry from "./IconFoundry";

function MessageItem(props) {
  const messageData = props.msgData;

  const launchMessage = () => {
      console.log("launch message: "+messageData.name);
  }

  return (
    <div
      onClick={launchMessage}
      className="message-item-container"
      id={"message-item-id-" + messageData.key}
    >
      <IconFoundry iconName={messageData.icon} />
      <span>{messageData.name}</span>

    </div>
  );
}

export default MessageItem;
