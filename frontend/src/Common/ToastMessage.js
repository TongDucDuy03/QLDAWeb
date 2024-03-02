import React, { useEffect } from 'react';

export default function ToastMessage({ isDisplay, setIsDisplay, message }) {
  useEffect(() => {
    if (isDisplay) {
      const timer = setTimeout(() => {
        setIsDisplay(false);
      }, 3000);

    }
  }, [isDisplay]);

  return (
    <>
      {isDisplay && (
        <div className='toast-container'>
          {message}
        </div>
      )}
    </>
  );
}
