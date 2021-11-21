import AppHeader from "./components/AppHeader";
import MessageSection from "./components/MessageSection";
import * as Values from "./Values.js";
//import * as Icons from "react-icons/fc";

// Our primary React component
function App() {
  return (
    <div id="app-container">
      <AppHeader />

      {Values.sections.map((section, index) => {
        return <MessageSection sectionKey={section.key} text={section.name} />
      })}

      

    </div>
  );
}

export default App;
