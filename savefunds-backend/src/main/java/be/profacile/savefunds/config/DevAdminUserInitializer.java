package be.profacile.savefunds.config;

import be.profacile.savefunds.domain.entity.User;
import be.profacile.savefunds.domain.enums.Role;
import be.profacile.savefunds.domain.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Profile;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
@Profile("dev")
@RequiredArgsConstructor
@Slf4j
public class DevAdminUserInitializer implements CommandLineRunner {

    static final String ADMIN_EMAIL = "admin@savefunds.local";
    static final String ADMIN_PASSWORD = "Admin123!";

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) {
        if (userRepository.existsByEmail(ADMIN_EMAIL)) {
            return;
        }

        User admin = new User();
        admin.setEmail(ADMIN_EMAIL);
        admin.setPasswordHash(passwordEncoder.encode(ADMIN_PASSWORD));
        admin.setFirstName("Admin");
        admin.setLastName("SaveFunds");
        admin.setRole(Role.ADMIN);
        admin.setEmailVerified(true);

        userRepository.save(admin);
        log.info("Compte admin dev cree: {}", ADMIN_EMAIL);
    }
}
