import AppHeader from "./components/AppHeader";
import MessageSection from "./components/MessageSection";

// Our primary React component
function App() {
  return (
    <div id="app-container">
      <AppHeader text="MNS Connections Mobile" />
      <MessageSection text="My Favorites" />
      <MessageSection text="Emergency" />
    </div>
  );
}

export default App;
