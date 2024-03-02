import React from 'react'

export default function ConfirmModal({ isDisplay, onOK, onCancel }) {
  return (
    <>
      {isDisplay && <div className='confirm-modal'>
        <p>Bạn chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng ?</p>
        <button onClick={onOK}>OK</button>
        <button onClick={onCancel}>Cancel</button>
      </div>}
    </>

  )
}
