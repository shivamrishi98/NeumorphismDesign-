//
//  ImagePicker.swift
//  NeumorphismDesign
//
//  Created by Shivam Rishi on 16/07/20.
//  Copyright © 2020 shivam. All rights reserved.
//

import Foundation
import SwiftUI

struct ImagePicker:UIViewControllerRepresentable
{
    
    var sourceType:UIImagePickerController.SourceType = .photoLibrary
    
    @Binding var selectedImage:UIImage
       @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(self)
    }
    
    class Coordinator:NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate
    {
        
        var parent:ImagePicker
        
        init(_ parent:ImagePicker)
        {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            
            parent.presentationMode.wrappedValue.dismiss()
            
        }
        
        
    }
    
    
    
}

