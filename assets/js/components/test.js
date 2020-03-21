import React, { useState } from "react";

function Test() {
  const [counter, setCounter] = useState(0);
  return (
    <div>
      <button onClick={() => setCounter(counter + 1)}>+</button>
      {counter}
    </div>
  );
}

export default Test;
