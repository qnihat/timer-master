import tkinter as tk
import datetime

class Application(tk.Frame):
    """"Simple timer application using tkinter."""

    def __init__(self, master, *args, **kwargs):
        tk.Frame.__init__(self, master, *args, **kwargs)
        self.master = master
        self.running = False
        self.time = 0
        #self.hours = 0
        self.mins = 0
        self.secs = 0
        self.build_interface()
        self.try_count=0

    def build_interface(self):
        """The interface function."""
        self.time_entry = tk.Entry(self)

        self.clock = tk.Label(self, text="00:00", font=("Courier", 140), width=10)
        self.clock.grid(row=1, column=1, stick="S")

        self.time_label = tk.Label(self, text="10.00 da saxla, üz nahiyəsi hədiyyə qazan!", font=("Courier", 30), width=55)
        self.time_label.grid(row=3, column=1, sticky="N")

        self.try_label = tk.Label(self, text="0", font=("Courier", 18), width=55)
        self.try_label.grid(row=4, column=1, sticky="N")

        self.click_btn = tk.PhotoImage(file='btn.png')
        self.power_button = tk.Button(self,image=self.click_btn, command=lambda: self.start(),borderwidth=5)
        self.power_button.grid(row=4, column=1, sticky="NE")

        self.master.bind("<Return>", lambda x: self.start())
        self.time_entry.bind("<Key>", lambda v: self.update())

    def calculate(self):
        """Calculates the time"""
        #self.hours = self.time // 3600
        self.mins = (self.time // 60) % 60
        self.secs = self.time % 60
        return "{:02d}:{:02d}".format(self.mins, self.secs)

    def update(self):
        """Checks if valid time entered and updates the timer"""
        self.time = int(self.time_entry.get())
        try:
            self.clock.configure(text=self.calculate())
        except:
            self.clock.configure(text="00:00")

    def timer(self):
        """Calculates the time to be displayed"""
        if self.running:
            #if self.time <= 0:
            #    self.clock.configure(text="Time's up!")
            #else:
            self.clock.configure(text=self.calculate())
            self.time += 1
            self.after(1, self.timer)


    def start(self):
        """Begins the timer"""
        try:
            self.time = int(self.time_entry.get())
            self.time_entry.delete(0, 'end')
        except:
            self.time = self.time
        self.power_button.configure(text="Stop", command=lambda: self.stop())
        self.master.bind("<Return>", lambda x: self.stop())
        self.running = True
        self.timer()
        if self.time>1:
            #print(f'{self.mins} {self.secs-1}')
            self.reset()
            pass


    def stop(self):
        """Stops the timer"""
        self.power_button.configure(text="Start", command=lambda: self.start())
        self.master.bind("<Return>", lambda x: self.start())
        self.running = False
        self.try_count += 1
        self.try_label.configure(text=f'{datetime.datetime.now()} : Cəhd sayı: {str(self.try_count)}')

    def reset(self):
        """Resets the timer to 0."""
        self.power_button.configure(text="Start", command=lambda: self.start())
        self.master.bind("<Return>", lambda x: self.start())
        self.running = False
        self.time = 0
        self.clock["text"] = "00:00"



if __name__ == "__main__":
    """Main loop which creates program."""
    root = tk.Tk()
    root.title("Milana Lazer")
    Application(root).pack(side="top", fill="both", expand=True)
    root.mainloop()