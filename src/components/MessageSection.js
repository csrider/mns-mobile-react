/* A message-section consists of:
 * - A visually distinct section
 * - A header, denoting the type or classification of messages
 * - A list of messages that are launchable
 */

import HeaderBar from "./HeaderBar";
import MessageItem from "./MessageItem";
import * as Values from "../Values.js";

function MessageSection(props) {
  const sectionData = props.sectionData;

  return (
    <div className="message-section">
      <HeaderBar
        text={sectionData.name}
        menuType={Values.menuTypes.messageSection}
      />

      <div className="messages-container">
        {Values.messages.map((message) => {
          if (message.sectionKey === sectionData.key) {
            return <MessageItem msgData={message} />;
          }
        })}
      </div>
    </div>
  );
}

export default MessageSection;
